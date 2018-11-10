#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>


struct ShaderProgramSource {

    std::string VertexSource;
    std::string FragmentSource;

};


static ShaderProgramSource ParseShader(const std::string& filepath) {

    std::ifstream stream(filepath);

    enum class ShaderType {
        NONE = -1, VERTEX = 0, FRAGMENT = 1
    };

    std::string line;
    std::stringstream ss[2];

    ShaderType type = ShaderType::NONE;

    while(getline(stream, line)) {
        if(line.find("#shader") != std::string::npos) {
            if(line.find("vertex") != std::string::npos ) {
                type = ShaderType::VERTEX;
            }//vertexmode
            else if (line.find("fragment") != std::string::npos ) {
                type = ShaderType ::FRAGMENT;
            } //fragmode
        } else {
            ss[(int)type] << line << '\n';
        }
    }

    return { ss[0].str(), ss[1].str()};

}

static unsigned int CompileShader(unsigned int type, const std::string& source ) {

    unsigned int id = glCreateShader(type);
    const char* src = source.c_str();

    glShaderSource(id, 1, &src, nullptr);
    glCompileShader(id);

    int result;
    glGetShaderiv(id, GL_COMPILE_STATUS, &result);

    if(result == GL_FALSE) {

        int length;
        //Returns a parameter from a shader object, LOG_LENGTH
        glGetShaderiv(id, GL_INFO_LOG_LENGTH, &length);
        char* message = (char*)alloca(length * sizeof(char));
        //Returns a parameter from a shader object, LOG_LENGTH
        glGetShaderInfoLog(id, GL_INFO_LOG_LENGTH, &length, message);

        std::cout << "Failed to compile shader. Shader Type: " << (type == GL_VERTEX_SHADER ? "vertex" : "fragment") <<  std::endl;
        std::cout << "Message: " << message << std::endl;

        glDeleteShader(id);
        return 0;

    }

    return id;

}


static unsigned int CreateShader(const std::string& vertexShader, const std::string& fragmentShader) {

    //Create Program and compile shaders
    unsigned int program = glCreateProgram();
    unsigned int vs = CompileShader(GL_VERTEX_SHADER, vertexShader);
    unsigned int fs = CompileShader(GL_FRAGMENT_SHADER, fragmentShader);

    //Attach Shaders to Program
    glAttachShader(program, vs);
    glAttachShader(program, fs);

    glLinkProgram(program);
    //checks to see whether the executables contained in program can execute given the current OpenGL state
    glValidateProgram(program);

    glDeleteShader(vs);
    glDeleteShader(fs);


    return program;

}


int main(void)
{
    GLFWwindow* window;

    /* Initialize the library */
    if (!glfwInit()) {
        std::cout << "GLFW failed to initialize..." << std::endl;

        return -1;
    } else {
        std::cout << "GLFW initialized..." << std::endl;

    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);


    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "OpenGL Learning", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glewExperimental = GL_TRUE;
    glfwMakeContextCurrent(window);

    if(glewInit() != GLEW_OK) {
        std::cout << "GLEW failed to initialize..." << std::endl;
    } else {
        std::cout << "GLEW initialized..." << std::endl;

    }


    std::cout << "OpenGL Version: " << glGetString(GL_VERSION) << std::endl;
    printf("Supported GLSL version is %s.\n", (char *)glGetString(GL_SHADING_LANGUAGE_VERSION));

    // tell GL to only draw onto a pixel if the shape is closer to the viewer
    glEnable(GL_DEPTH_TEST); // enable depth-testing
    glDepthFunc(GL_LESS); // depth-testing interprets a smaller value as "closer"


    //Specify buffer
    unsigned int buffer;
    //Float array for buffer data
    float positions[6] = {
           -0.5f, -0.5f,
            0.0f,  0.5f,
            0.5f, -0.5f
    };
    //Generate one buffer
    glGenBuffers(1, &buffer);
    //Bind ARRAY_BUFFER to generated buffer
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    //Set buffer data with positions and add hints for STATIC and DRAW
    glBufferData(GL_ARRAY_BUFFER, 6 * sizeof(float), positions, GL_STATIC_DRAW);


    unsigned int vao = 0;
    glGenVertexArrays(1, &vao);
    glBindVertexArray(vao);
    //Enable Vertex Attrib
    glEnableVertexAttribArray(0);
    //Create vertex attrib
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(float)*2, nullptr);

    ShaderProgramSource source = ParseShader("res/shaders/Basic.shader");

    unsigned int shader = CreateShader(source.VertexSource, source.FragmentSource);
    glUseProgram(shader);

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glBindVertexArray(buffer);
        glDrawArrays(GL_TRIANGLES, 0,3);

        //For indexed buffers
        //  glDrawElements()

        /* Poll for and process events */
        glfwPollEvents();
        /* Swap front and back buffers */
        glfwSwapBuffers(window);


    }

    glDeleteShader(shader);

    glfwTerminate();
    return 0;
}