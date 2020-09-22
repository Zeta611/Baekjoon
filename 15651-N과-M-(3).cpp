#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>

void choose(int n, int m, std::vector<int>& comb)
{
    if (m == 0) {
        std::copy(
            begin(comb), end(comb),
            std::ostream_iterator<int>(std::cout, " "));
        std::cout << '\n';
        return;
    }

    for (int i = 1; i <= n; ++i) {
        comb.push_back(i);
        choose(n, m - 1, comb);
        comb.pop_back();
    }
}

int main()
{
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);

    int n, m;
    std::cin >> n >> m;
    std::vector<int> comb;
    comb.reserve(m);
    choose(n, m, comb);
    return 0;
}
