### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ 273a3776-48fd-11ef-3e78-dd2212043019
md""" 


# String Comparison

"""

# ╔═╡ f92fc02b-a5ab-46ad-9b8e-5a2265708d1d
s1 = "dogs and cats"

# ╔═╡ 4735cffe-1e2d-41a0-8a22-a982b904d2f3
s2 = "cats and dogs"

# ╔═╡ 0d92a119-6fee-4309-af88-9dc8956203d5


# ╔═╡ 6e8f5f88-f0b6-4134-90d1-6977d3214d5a
md""" ## Function for comparing two strings """

# ╔═╡ e5f87ef3-51a5-4558-a263-36f4a934af4a


function wrap_differences_with_span(stringA::String, stringB::String)::String
    lenA = length(stringA)
    lenB = length(stringB)
    max_len = max(lenA, lenB)
    resultA = ""
    resultB = ""
    in_diff = false

    for i in 1:max_len
        charA = i <= lenA ? stringA[i] : ""
        charB = i <= lenB ? stringB[i] : ""
        
        if charA != charB
            if !in_diff
                resultA *= """<span class = "dDiff">"""
                resultB *= """<span class = "nDiff">"""
                in_diff = true
            end
            resultA *= charA
            resultB *= charB
        else
            if in_diff
                resultA *= "</span>"
                resultB *= "</span>"
                in_diff = false
            end
            resultA *= charA
            resultB *= charB
        end
    end

    # Close any remaining open <span> tags
    if in_diff
        resultA *= "</span>"
        resultB *= "</span>"
    end

    # Return the result
    if stringA == stringB
        return stringA
    else
        return "<p>" * resultA *"</p>\r" * """<p><span class = "normalizedLine">""" * resultB * """</span></p>"""
    end
end


# ╔═╡ 7bf458c3-739e-4287-9a60-18a3e73d7a11
print(wrap_differences_with_span(s1, s2))

# ╔═╡ ad6c157b-4401-4070-afbe-a9f23d254b2e


# ╔═╡ Cell order:
# ╠═273a3776-48fd-11ef-3e78-dd2212043019
# ╠═f92fc02b-a5ab-46ad-9b8e-5a2265708d1d
# ╠═4735cffe-1e2d-41a0-8a22-a982b904d2f3
# ╠═7bf458c3-739e-4287-9a60-18a3e73d7a11
# ╠═0d92a119-6fee-4309-af88-9dc8956203d5
# ╠═6e8f5f88-f0b6-4134-90d1-6977d3214d5a
# ╠═e5f87ef3-51a5-4558-a263-36f4a934af4a
# ╠═ad6c157b-4401-4070-afbe-a9f23d254b2e
