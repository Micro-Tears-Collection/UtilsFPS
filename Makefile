JDK8 = Z:/JDK8/bin/
JMELIBS = Z:/JMELIBS/

JC = $(JDK8)javac
JAR = $(JDK8)jar

SRC = ./src
BUILD = ./build
DIST = ./dist
PROJECT_NAME = $(notdir $(CURDIR))

JFLAGS = -classpath $(JMELIBS) -source 1.3 -target 1.3 -sourcepath $(SRC) -s $(BUILD)

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

sources = $(call rwildcard, $(SRC), *.java)
classes = $(call rwildcard, $(BUILD), *.class)

default:
	$(JC) $(JFLAGS) $(sources) -d $(BUILD)
	$(JAR) -cf $(DIST)/$(PROJECT_NAME).jar  -C $(BUILD) $(classes:$(BUILD)/%=%)
	
clean:
	$(RM) $(BUILD)/*.class