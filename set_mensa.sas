%macro set_mean(inds,num,var);

       proc means data=&inds.;
          var &var. ;
          output   out = &inds._&num. mean= mean stddev = stddev  n = n max=max min=min median=median Q1=Q1 Q3=Q3;
       run;
       data &var._&inds._&num.;
              set &inds._&num.;
              num = &num.;
       run;
%mend;
