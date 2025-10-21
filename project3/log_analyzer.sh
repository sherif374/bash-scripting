#!/bin/bash
set -e
LOG_FILE= $1
check_file() { if [ -z $LOG_FILE ]; then
	          echo "no log file provided. "
	          echo "usage: $0 <path/to/log file>"
	          exit1
               fi

               if [ ! -f $LOG_FILE  ]; then
		       echo "log file not found"
		       exit 1
	       fi
       }

       report_top_ips() { cat $LOG_FILE | awk '{print$1}' | sort  | uniq -c | sort -nr | head -n  10 
       }
       
       report_top_pages() { cat $LOG_FILE | awk '{print$7}' | sort  | uniq -c | sort -nr | head -n 10
       }
    
       http_error_summary() { cat $LOG_FILE | awk '($9 ~ /^4/) || ($9 ~ /^5/) {print$9}' | sort  | uniq -c | sort -nr | head -n  10
       }   

       check_file
       report_top_ips
       report_top_pages
       http_error_summary
