#include <stdio.h>  
  
#define __STDC_CONSTANT_MACROS  
  
#ifdef __cplusplus  
extern "C"  
{  
#endif  
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
#include "libavfilter/avfilter.h"
#ifdef __cplusplus  
};  
#endif  
  
  
/** 
 * AVFormat Support Information 
 */  
char * avformatinfo(){  
  
    char *info=(char *)malloc(40000);  
    memset(info,0,40000);  
  
    av_register_all();  
  
    AVInputFormat *if_temp = av_iformat_next(NULL);  
    AVOutputFormat *of_temp = av_oformat_next(NULL);  
    //Input  
    while(if_temp!=NULL){  
        sprintf(info, "%s[In ] %10s\n", info, if_temp->name);  
        if_temp=if_temp->next;  
    }  
    //Output  
    while (of_temp != NULL){  
        sprintf(info, "%s[Out] %10s\n", info, of_temp->name);  
        of_temp = of_temp->next;  
    }  
    return info;  
}  
  
/** 
 * AVCodec Support Information 
 */  
char * avcodecinfo()  
{  
    char *info=(char *)malloc(40000);  
    memset(info,0,40000);  
  
    av_register_all();  
  
    AVCodec *c_temp = av_codec_next(NULL);  
  
    while(c_temp!=NULL){  
        if (c_temp->decode!=NULL){  
            sprintf(info, "%s[Dec]", info);  
        }  
        else{  
            sprintf(info, "%s[Enc]", info);  
        }  
        switch (c_temp->type){  
        case AVMEDIA_TYPE_VIDEO:  
            sprintf(info, "%s[Video]", info);  
            break;  
        case AVMEDIA_TYPE_AUDIO:  
            sprintf(info, "%s[Audio]", info);  
            break;  
        default:  
            sprintf(info, "%s[Other]", info);  
            break;  
        }  
  
        sprintf(info, "%s %10s\n", info, c_temp->name);  
  
        c_temp=c_temp->next;  
    }  
    return info;  
}  
  
/** 
 * AVFilter Support Information 
 */  
char * avfilterinfo()  
{  
    char *info=(char *)malloc(40000);  
    memset(info,0,40000);  
  
    avfilter_register_all();  
  
    AVFilter *f_temp = (AVFilter *)avfilter_next(NULL);  
      
    while (f_temp != NULL){  
        sprintf(info, "%s[%15s]\n", info, f_temp->name);  
        f_temp=f_temp->next;  
    }  
    return info;  
}  
  
/** 
 * Configuration Information 
 */  
char * configurationinfo()  
{  
    char *info=(char *)malloc(40000);  
    memset(info,0,40000);  
  
    av_register_all();  
  
    sprintf(info, "%s\n", avcodec_configuration());  
  
    return info;  
}  
  
int main(int argc, char* argv[])  
{  
    char *infostr=NULL;  
    infostr=configurationinfo();  
    printf("\n<<Configuration>>\n%s",infostr);  
    free(infostr);  
  
    infostr=avformatinfo();  
    printf("\n<<AVFormat>>\n%s",infostr);  
    free(infostr);  
  
    infostr=avcodecinfo();  
    printf("\n<<AVCodec>>\n%s",infostr);  
    free(infostr);  
  
    infostr=avfilterinfo();  
    printf("\n<<AVFilter>>\n%s",infostr);  
    free(infostr);  
  
    return 0;  
}