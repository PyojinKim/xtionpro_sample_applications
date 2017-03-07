#include <stdio.h>
#include <opencv2/opencv.hpp>


int main(void)
{
	cv::Mat depth_image, color_image;
	cv::VideoCapture cap(CV_CAP_OPENNI_ASUS);

	cv::namedWindow("xtionpro-Depth", 1);
	cv::namedWindow("xtionpro-RGB", 1);

	while(1) {
		cap.grab();

		cap.retrieve(depth_image, CV_CAP_OPENNI_DEPTH_MAP);
		cap.retrieve(color_image, CV_CAP_OPENNI_BGR_IMAGE);

		cv::imshow("xtionpro-Depth", depth_image);
		cv::imshow("xtionpro-RGB", color_image);

		if(cv::waitKey(30) >= 0) {
			break;
		}
	}

  return 0;
}
