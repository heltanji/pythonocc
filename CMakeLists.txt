##Copyright 2010 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU General Public License for more details.
##
##You should have received a copy of the GNU General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

# pythonOCC cmake build file
PROJECT(pythonOCC)
# set pythonOCC version
SET(pythonOCC_VERSION_MAJOR 0)
SET(pythonOCC_VERSION_MINOR 5)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(CMAKE_BUILD_TYPE "Release") #Default, build in release mode
MESSAGE("${CMAKE_CXX_FLAGS}") 
SET(BUILD_SHARED_LIBS ON)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

MESSAGE("Building pythonOCC 0.5")

###################
# General options #
###################

# By default, GEOM and SMESH wrappers are disbled
OPTION(WRAP_GEOM "Wraps the salomegeometry library (enabling parametric modeling)" OFF)
OPTION(WRAP_SMESH "Wraps the salomesmesh library (enabling advanced meshing features" OFF)

##########
# Python #
##########
FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

##############################################################
# 32/64 bit detection. To achieve that point, python is used.
# From python, running:
# >>import sys
# >> sys.maxint
# will return:
# 9223372036854775807 on 64bit
# and
# 2147483647 on 32bit systems
###############################################################
MESSAGE("Check whether the system is 32 or 64 bit." )
EXECUTE_PROCESS(COMMAND python -c "import sys;print sys.maxint" OUTPUT_VARIABLE maxint_str)
IF (maxint_str MATCHES "2147483647")
    MESSAGE("-- 32bit system detected")
    SET(MODE "32bit")
ELSE(maxint_str MATCHES "2147483647")
    MESSAGE("-- 64bit system detected")
    SET(MODE "64bit")
ENDIF(maxint_str MATCHES "2147483647")

########
# SWIG #
########
FIND_PACKAGE(SWIG)
INCLUDE(${SWIG_USE_FILE})

########################################
# OpenCASCADE include and lib location #
########################################
# Find OpenCASCADE library, set include and lib path
IF(WIN32)
    # Under Windows, check the CASROOT env variable
    SET(OCC_INCLUDE_PATH "$ENV{CASROOT}\\inc")
    SET(OCC_LIB_PATH "$ENV{CASROOT}\\win32\\lib")
    # Find the Standard_Real.hxx header in this path
ELSE(WIN32) #Unix
    SET(OCC_INCLUDE_PATH "/Library/OpenCASCADE/6.3.0/inc")
    SET(OCC_LIB_PATH "/Library/OpenCASCADE/6.3.0/lib")
ENDIF(WIN32)

# Check that these paths are ok
FIND_PATH(OCC_INCLUDE_PATH Standard_Real.hxx ${OCC_INCLUDE_PATH})
FIND_LIBRARY(RESULT_LIB TKernel ${OCC_LIB_PATH})
MESSAGE("${RESULT_PATH}")
MESSAGE("${RESULT_LIB}")
MESSAGE("-- OpenCASCADE include directory: ${OCC_INCLUDE_PATH}")
MESSAGE("-- OpenCASCADE shared libraries directory: ${OCC_LIB_PATH}")

# List of OpenCASCADE shared libraries to link with
SET(OCC_LIBRARIES BinLPlugin BinPlugin BinXCAFPlugin FWOSPlugin PTKernel
                  StdLPlugin StdPlugin TKAdvTools TKBin TKBinL TKBinTObj TKBinXCAF
                  TKBO TKBool TKBRep TKCAF TKCDF TKCDLFront TKCPPClient TKCPPExt
                  TKCPPIntExt TKCPPJini TKCSFDBSchema TKernel
                  TKFeat TKFillet TKG2d TKG3d TKGeomAlgo TKGeomBase TKHLR TKIDLFront
                  TKIGES TKLCAF TKMath TKMesh TKMeshVS TKNIS TKOffset
                  TKOpenGl TKPCAF TKPLCAF TKPrim TKPShape TKService TKShapeSchema
                  TKShHealing TKStdLSchema TKStdSchema TKSTEP TKSTEP209 TKSTEPAttr
                  TKSTEPBase TKSTL TKTCPPExt TKTObj TKTopAlgo
                  TKV2d TKV3d TKVRML TKWOK TKWOKTcl TKXCAF TKXCAFSchema
                  TKXDEIGES TKXDESTEP TKXMesh TKXml TKXmlL TKXmlTObj
                  TKXmlXCAF TKXSBase XCAFPlugin
                  XmlLPlugin XmlPlugin XmlXCAFPlugin)

# Tells CMake where are the required headers
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${OCC_INCLUDE_PATH})
LINK_DIRECTORIES(${OCC_LIB_PATH})

#######################################
# salomegeom include and lib location #
#######################################
IF(WRAP_GEOM)
    SET(GEOM_INCLUDE_PATH ./src/contrib/SalomeGeometry/inc_pythonocc)
    INCLUDE_DIRECTORIES(${GEOM_INCLUDE_PATH})
ENDIF(WRAP_GEOM)

######################################################
# Configure Build settings according to the platform #
######################################################
IF(UNIX)
  IF(APPLE)
    ######### MacOSX ###########
    MESSAGE("-- MacOSX system detected")
    ADD_DEFINITIONS(-DHAVE_CONFIG_H -DHAVE_LIMITS_H -DCSFDB -DLIN -DOCC_CONVERT_SIGNALS -D__PYTHONOCC_MAXINT__=2147483647)
    SET(CMAKE_SWIG_FLAGS -O -DCSFDB -DHAVE_CONFIG_H -DHAVE_LIMITS_H -DOCC_CONVERT_SIGNALS)
    SET(SWIG_FILES_PATH ./src/wrapper/SWIG/linux_darwin)
  ELSE(APPLE)
    ######### Unix/Linux ###########
    MESSAGE("-- Unix/Linux system detected")
    ADD_DEFINITIONS(-DHAVE_CONFIG_H -DHAVE_LIMITS_H -DCSFDB -DLIN -DOCC_CONVERT_SIGNALS -D__PYTHONOCC_MAXINT__=2147483647)
    SET(CMAKE_SWIG_FLAGS -O -DCSFDB -DHAVE_CONFIG_H -DHAVE_LIMITS_H -DOCC_CONVERT_SIGNALS -DLIN -DLIN_INTEL -D_GNU_SOURCE=1)
    SET(SWIG_FILES_PATH ./src/wrapper/SWIG/linux_darwin)
  ENDIF(APPLE)
ELSE(UNIX)
  IF(WIN32)
    ######### Windows ###########
    MESSAGE("-- Windows system detected")
    ADD_DEFINITIONS(-DWNT -DWIN32 -D_WINDOWS -DCSFDB -D__PYTHONOCC_MAXINT__=2147483647)
    SET(CMAKE_SWIG_FLAGS -O -DCSFDB -DWIN32 -D_WINDOWS)
    SET(SWIG_FILES_PATH ./src/wrapper/SWIG/win32)
  ELSE(WIN32)
    MESSAGE("Unknown platform")
  ENDIF(WIN32)
ENDIF(UNIX)
# If in 64bit mode, we have to define the _OCC64 variable
IF (MODE MATCHES "64bit")
    ADD_DEFINITIONS(-D_OCC64)
    SET(CMAKE_SWIG_FLAGS ${CMAKE_SWIG_FLAGS} -D_OCC64)
ENDIF(MODE MATCHES "64bit")

############################
# OpenCASCADE Modules list #
############################
LIST(APPEND OCC_MODULES "Standard" "MMgt")

###############################
# salomegeometry Modules list #
###############################
LIST(APPEND GEOM_MODULES "Archimede" "SGEOM" "GEOMAlgo" "GEOMImpl" "BlockFix" "NMTDS" "Partition" "ShHealOper" "Sketcher")

###############################
# salomesmesh Modules list #
###############################
LIST(APPEND SMESH_MODULES "SMDSAbs" "SMDS" "SMESHDS" "SMESH" "StdMeshers")

###################
# Wrapper Modules #
###################

# OpenCASCADE
FOREACH(OCC_MODULE ${OCC_MODULES})
    SET(FILE ${SWIG_FILES_PATH}/${OCC_MODULE}.i)
	SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
    SWIG_ADD_MODULE(${OCC_MODULE} python ${FILE})
    SWIG_LINK_LIBRARIES(${OCC_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES})
ENDFOREACH(OCC_MODULE)

# salomegeometry
IF(WRAP_GEOM)
    LINK_DIRECTORIES(${OCC_LIB_PATH})
	FOREACH(GEOM_MODULE ${GEOM_MODULES})
	    SET(FILE ${SWIG_FILES_PATH}/${GEOM_MODULE}.i)
		SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
	    SWIG_ADD_MODULE(${GEOM_MODULE} python ${FILE})
	    SWIG_LINK_LIBRARIES(${GEOM_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES} ${GEOM_LIBRARIES})
	ENDFOREACH(GEOM_MODULE)
ENDIF(WRAP_GEOM)

# salomesmesh
IF(WRAP_SMESH)
	FOREACH(SMESH_MODULE ${SMESH_MODULES})
	    SET(FILE ${SWIG_FILES_PATH}/${SMESH_MODULE}.i)
		SET_SOURCE_FILES_PROPERTIES(${FILE} PROPERTIES CPLUSPLUS ON)
	    SWIG_ADD_MODULE(${SMESH_MODULE} python ${FILE})
	    SWIG_LINK_LIBRARIES(${SMESH_MODULE} ${PYTHON_LIBRARIES} ${OCC_LIBRARIES} ${SMESH_LIBRARIES})
ENDFOREACH(OCC_MODULE)
ENDIF(WRAP_SMESH)