(add-hook 'c++-mode-hook '(lambda() (when (empty-buffer?) (insert-c++-template))))

(defun empty-buffer? () (= (buffer-end 1) (buffer-end -1)))

(defun insert-c++-template ()
  (interactive)
  (insert "#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define fr(i, n) for(int i=0;i<n;i++)
#define forall(i, j, n) for(int i=j; i<n; i++)
#define all(c) c.begin(), c.end()
#define tr(container, it) for (__typeof(container.begin()) it = container.begin(); it != container.end(); it++)
#define rt(container, it) for (__typeof(container.rbegin()) it = container.rbegin(); it != container.rend(); it++)
#define present(container, element) (container.find(element) != container.end())
#define cpresetn(container, element) (find(all(container)), element) != container.end())
#define sz(a) int((a).size())
#define pb(a) push_back(a)
#define si(n) scanf(\"%d\", &n)
#define sll(n) scanf(\"%lld\", &n)
#define pi(n) 0*printf(\"%d\\n\", n)
#define pll(n) 0*printf(\"%lld\\n\", n)
#define SET(container, value) memset(container, value, sizeof container)
#define MP make_pair
#define F first
#define S second
#define scan_all(...) __s(__VA_ARGS__)
template <typename Arg1>
void __s(Arg1&& arg1) {
  cin >> arg1;
}
template <typename Arg1, typename... Args>
void __s(Arg1&& arg1, Args&&... args) {
  cin >> arg1 ; __s(args...);
}
#define trace(...) __f(#__VA_ARGS__, __VA_ARGS__)
template <typename Arg1>
void __f(const char* name, Arg1&& arg1){
	cerr << name << \" : \" << arg1 << endl;
}
template<typename Arg1, typename... Args>
void __f(const char* names, Arg1&& arg1, Args&&... args){
	const char* comma = strchr(names+1, ',');
	cerr.write(names, comma-names) << \" : \" << arg1 << \" | \"; __f(comma+1, args...);
}
std::vector<std::string> tokenize(
				  const std::string& s,
				  const std::string& delims){
  std::vector<std::string> tokens;
  size_t offset = 0;
  while (true) {
    size_t nonDelim = s.find_first_not_of(delims, offset);
    if (nonDelim == std::string::npos) {
      break; // Nothing left.
    }
    size_t delim = s.find_first_of(delims, nonDelim);
    // Finish tokenizing if this is the last token,
    // or we've found enough tokens.
    if (delim == std::string::npos) {
      tokens.push_back(s.substr(nonDelim));
      break;
    }
    tokens.push_back(s.substr(nonDelim, delim - nonDelim));
    offset = delim;
  }
  return tokens;
}
int main(){
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  return 0;
}"))
