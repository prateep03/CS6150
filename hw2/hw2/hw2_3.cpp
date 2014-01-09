/* Author : Prateep  */
#include <iostream>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <cctype>
#include <algorithm>
#include <iterator>
#include <map>
#include <vector>
#include <list>
#include <set>
#include <queue>
#include <cassert>
#include <deque>
#include <stack>
#include <bitset>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iomanip>
#include <cstring>
#include <cmath>
#include <ctime>

using namespace std;

#define LET(x,a)        __typeof(a) x(a)
#define IFOR(i,a,b)     for(LET(i,a);i!=(b);++i)
#define EACH(it,v)      IFOR(it,v.begin(),v.end())
#define FOR(i,a,b)      for(int i=(int)(a) ; i < (int)(b);i++)
#define REP(i,n)        FOR(i,0,n)
#define SZ              size()
#define PB              push_back
#define PF              push_front
#define V(x)            vector< x >
#define two(X)          (1<<(X))
#define twoL(X)         (((int64)(1))<<(X))
#define contain(S,X)    (((S)&two(X))!=0)
#define containL(S,X)   (((S)&twoL(X))!=0
#define swap(x,y)       x ^=y ^= x^=y
#define ALL(v)          (v).begin(),(v).end()

const double pi=acos(-1.0);
const double eps=1e-11;
const int oo=0x3f3f3f3f;
template<class T> inline void checkmin(T &a,T b){if(b<a) a=b;}
template<class T> inline void checkmax(T &a,T b){if(b>a) a=b;}
template<class T> inline T sqr(T x){return x*x;}
typedef pair<int,int> ipair;
template<class T> inline T lowbit(T n){return (n^(n-1))&n;}
template<class T> inline int countbit(T n){return (n==0)?0:(1+countbit(n&(n-1)));}

typedef long long       ll;
typedef V(int)          VI;
typedef V(VI)           VII;
typedef V(string)       VS;
typedef long long       int64;
typedef long double     LD;
typedef pair<int,int>   PI;

#define LocalHost
#pragma comment(linker, "/STACK:200000000")
const int MAXLEN = 100;
int A[MAXLEN];
int solve(string s)
{
  VII L(s.length(), vector<int>(1,1));
  REP(i,s.length()) FOR(j,2,s.length()) {
    if(i-j+1 >= 0 && s[i] == s[i-j+1]) {
      bool inp = false;
      if(j == 2) inp = true;
      else {
        int k = L[i-1].size();
        if(L[i-1][k-1] == j-2 || (k >= 2 && L[i-1][k-2] == j-2)) {
          inp = true;
        }
      }
      if(inp) L[i].PB(j);
    }
  }
  memset(A,oo,sizeof(A)); 
  A[1] = 0; A[0] = 0;
  for(int i = 1; i < s.size(); i++) {
    REP(j,L[i].size()) if(i-L[i][j] >= 0) {
      //cout << (i-L[i][j]) << endl;
      checkmin(A[i+1], A[i-L[i][j]]+1);
    }
  }
  REP(i,s.size()) cout << A[i] << ' ';
  cout << endl;
  return A[s.size()];
}

int main()
{
#ifdef LocalHost
	freopen("input.txt","r",stdin);
	freopen("output.txt","w",stdout);
#endif
   string s; cin >> s;
   int res = solve(s);
   cout << res << endl;
   return 0;
}
