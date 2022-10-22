MAKEFILE	=	Makefile

###### Compiler, tools and options

CC			=	gcc
CXX			=	g++
CXXFLAGS	=	-std=gnu++11 -g
INCPATH		=	-I./include
SRCPATH		=	./src

###### Output directory

OBJECTS_DIR =	./
TARGET		=	gml2sml.out

###### Files

SOURCES		=	$(notdir $(wildcard $(SRCPATH)/*.cpp))
OBJECTS		=	$(addprefix $(OBJECTS_DIR),$(patsubst %.cpp,%.o,$(SOURCES)))

$(TARGET):$(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

%.o:$(SRCPATH)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCPATH) -c $< -o $@

###### Clean output files

.PHONY:clean
clean:
	rm -rf $(OBJECTS) $(TARGET)
	
