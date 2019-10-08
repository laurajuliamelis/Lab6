#include <Rcpp.h>
#include <vector>
#include <string>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
vector<int> intToBinary(int x, unsigned int head) {
  
  vector<int> arr;
  int q = x;
  int r;
  while(q != 0 || arr.size() < head) {
    if(arr.size() == head){
      break;
    }
    r = q % 2;
    q = q / 2;
    arr.push_back(r);
  }
  
  reverse(arr.begin(), arr.end());
  
  return arr;
}