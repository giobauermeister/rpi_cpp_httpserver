#include <iostream>
#include <httpserver.hpp>

using namespace httpserver;

class helloworld_resource : public http_resource {
public:
    std::shared_ptr<http_response> render(const http_request&) {
        return std::shared_ptr<http_response>(new string_response("Hello RPi!", 200, "text/html"));
    }
};

int main(int argc, char** argv)
{
    std::cout << "Hello RPi!" << std::endl;

    webserver ws = create_webserver(8081);

    helloworld_resource hwr;
    ws.register_resource("/hello", &hwr);
    ws.start(true);

    return 0;
}
