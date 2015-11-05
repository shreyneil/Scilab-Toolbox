// This file is released under the 3-clause BSD license. See COPYING-BSD.

names = [	
			"imread","opencv_imread";
                     "bwlookup","opencv_bwlookup";
     	
            "imboxfilt","opencv_imboxfilt";	
 	    "imapplymatrix","opencv_imapplymatrix";
"integralImage","opencv_integralImage";	
"imhistmatch","opencv_imhistmatch";	
"gabor","opencv_gabor";
"imgaborfilt","opencv_imgaborfilt";
			];

files = [
			"opencv_imread.cpp",
     		"opencv_bwlookup.cpp",
            "opencv_imboxfilt.cpp",
	    "opencv_imapplymatrix.cpp",
"opencv_integralImage.cpp",
"opencv_imhistmatch.cpp",
"opencv_gabor.cpp",
"opencv_imgaborfilt.cpp"
		];

function builder_gw_cpp()
    WITHOUT_AUTO_PUTLHSVAR = %t;
    copyfile("sci_gateway/cpp/common.h",TMPDIR);
    copyfile("sci_gateway/cpp/common.cpp",TMPDIR);
tbx_build_gateway("skeleton_imageprocessing", ..
	names, ..
    files, ..
    get_absolute_file_path("builder_gateway_cpp.sce"),[],["-lopencv_core -lopencv_highgui -lopencv_imgproc"],["-I/usr/local/include/opencv/ -I/usr/local/include/opencv2/"],"g++ -ggdb `pkg-config --cflags opencv` -o `basename opencv_imread.cpp .cpp` opencv_imread.cpp `pkg-config --libs opencv`");
endfunction

builder_gw_cpp();
clear builder_gw_cpp; // remove builder_gw_cpp on stack
