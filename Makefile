#JDK8 = Z:/JDK8/bin/
#JMELIBS = Z:/JMELIBS/
JDK8 := "C:/Program Files"/Java/jdk1.8.0_45/bin/
JMELIBS := C:/Users/USER/Documents/NetBeansProjects/melibs/

JC := $(JDK8)javac
JAR := $(JDK8)jar

SRC := ./src
BUILD := ./build
DIST := ./dist
LIBS :=

PROJECT_NAME := $(notdir $(CURDIR))

CLASSPATHLIBS = $(if $(LIBS),$(if $(JMELIBS),;,$(null))$(subst $(space),;,$(LIBS)),$(null))
JFLAGS := -Xlint:-options -classpath "$(JMELIBS)$(CLASSPATHLIBS)" -source 1.3 -target 1.3 -sourcepath $(SRC) -s $(BUILD)

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

sources := $(call rwildcard, $(SRC), *.java)
classes := $(addsuffix .class, $(basename $(patsubst %, $(BUILD)/%, $(sources:$(SRC)/%=%))))

#$(SRC)/%.java:
#	$(JC) $(JFLAGS) $@ -d $(BUILD)
	
default: $(PROJECT_NAME)

#compile: $(sources)
compile: 
	$(JC) $(JFLAGS) $(sources) -d $(BUILD)

#compile and build jar
$(PROJECT_NAME): compile
	$(JAR) -cf $(DIST)/$(PROJECT_NAME).jar $(LIBS) -C $(BUILD) $(classes:$(BUILD)/%=%)
	
#default:
#	$(JC) $(JFLAGS) $(sources) -d $(BUILD)
#	$(JAR) -cf $(DIST)/$(PROJECT_NAME).jar  -C $(BUILD) $(classes:$(BUILD)/%=%)
	
clean:
	$(RM) $(BUILD)/*.class