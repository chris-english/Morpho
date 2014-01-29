#ifndef angcal_H_
#define angcal_H_

#include <RcppArmadillo.h>
#include "doozers.h"

using namespace Rcpp;
using namespace std;
using namespace arma;

double angcalcArma(colvec a, colvec b, bool circle) {
  double alen = norm(a,2);
  double blen = norm(b,2);
  if (alen > 0)
    a = a/alen;
  if (blen > 0)
    b = b/blen;
  colvec diffvec = a-b;
  double angle = acos((dot(diffvec,diffvec)-2)/-2);
  if (!circle) {
    double pi = 3.141592653589793239;
    angle = pi-angle;
  }
  return angle;
}
		
double angcalcRcpp(NumericVector a_, NumericVector b_, bool circle) {
  colvec a(a_.begin(),a_.size(),false);
  colvec b(b_.begin(),b_.size(),false);
  double alen = sqrt(dot(a,a));
  double blen = sqrt(dot(b,b));
  if (alen > 0)
    a = a/alen;
  if (blen > 0)
    b = b/blen;
  colvec diffvec = a-b;
  double angle = acos((dot(diffvec,diffvec)-2)/-2);
  if (!circle) {
    double pi = 3.141592653589793239;
    angle = pi-angle;
  }
  return angle;
}
void crosspArma(colvec x, colvec y, colvec& z) {
  z(0) = x(1)*y(2)-x(2)*y(1);
  z(1) = x(2)*y(0)-x(0)*y(2);
  z(2) = x(0)*y(1)-x(1)*y(0);
  double lz = sqrt(dot(z,z));
  if (lz > 0) 
    z = z/lz;
}
#endif /*angcal_H_*/
