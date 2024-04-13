#!/bin/bash

rm -rf build && mkdir build && cd build

cmake \
	-DCMAKE_INSTALL_PREFIX=./ \
	-DEIGEN_ROO_DIR=/usr/include/eigen3 \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-DPLUGIN_IO_QLAS=ON \
	-DPLUGIN_STANDARD_QPOISSON_RECON=ON \
	-DPLUGIN_IO_QCORE=ON \
	..

	# -DPLUGIN_STANDARD_QHOUGH_NORMALS=ON \
	# -DPLUGIN_EXAMPLE_GL=ON \
	# -DPLUGIN_EXAMPLE_IO=ON \
	# -DPLUGIN_EXAMPLE_STANDARD=ON \
	# -DPLUGIN_GL_QEDL=ON \
	# -DPLUGIN_GL_QSSAO=ON \
	# -DPLUGIN_IO_QADDITIONAL=ON \
	# -DPLUGIN_STANDARD_QANIMATION=ON \
	# -DPLUGIN_STANDARD_QBROOM=ON \
	# -DPLUGIN_STANDARD_QCANUPO=OFF \
	# -DPLUGIN_STANDARD_QCOMPASS=ON \
	# -DPLUGIN_STANDARD_QCSF=ON \
	# -DPLUGIN_STANDARD_QFACETS=ON \
	# -DPLUGIN_STANDARD_QHPR=ON \
	# -DPLUGIN_STANDARD_QM3C2=ON \
	# -DPLUGIN_STANDARD_QPCV=ON \
	# -DPLUGIN_STANDARD_QSRA=ON \
# -DPLUGIN_IO_QPHOTOSCAN=ON # -DPLUGIN_IO_QE57=ON \

# validate if cmake was executed successfully
if [ $? -ne 0 ]; then
	printf "\n====================================================\n"
	printf "ERRO NA CONFIGURAÇÃO"
	printf "\n====================================================\n"
	exit 1
fi

printf "\n====================================================\n"
printf "CONFIGURAÇÃO FINALIZADA"

printf "\n====================================================\n"
cmake --build . --parallel

# validate if build was executed successfully
if [ $? -ne 0 ]; then
	printf "\n====================================================\n"
	printf "ERRO NA BUILD"
	printf "\n====================================================\n"
	exit 1
fi

printf "\n====================================================\n"
printf "BUILD FINALIZADA"
printf "\n====================================================\n"

cmake --install .
