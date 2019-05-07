filetype plugin on
runtime! plugin/textobj/brace.vim


describe 'iv'
    it 'selects brackets'
        put! = 'foo [1, 2, 3] bar'
        normal! 9|
        normal dij
        Expect getline(1) == 'foo [] bar'
    end

    it 'selects curly braces'
        put! = 'foo {1, 2, 3} bar'
        normal! 9|
        normal dij
        Expect getline(1) == 'foo {} bar'
    end

    it 'selects parentheses'
        put! = 'foo (1, 2, 3) bar'
        normal! 9|
        normal dij
        Expect getline(1) == 'foo () bar'
    end

    it 'selects the innermost container'
        put! = 'foo {[(1, 2, 3)]} bar'
        normal! 9|
        normal dij
        Expect getline(1) == 'foo {[()]} bar'
    end
end


describe 'av'
    it 'selects brackets'
        put! = 'foo [1, 2, 3] bar'
        normal! 9|
        normal daj
        Expect getline(1) == 'foo  bar'
    end

    it 'selects curly braces'
        put! = 'foo {1, 2, 3} bar'
        normal! 9|
        normal daj
        Expect getline(1) == 'foo  bar'
    end

    it 'selects parentheses'
        put! = 'foo (1, 2, 3) bar'
        normal! 9|
        normal daj
        Expect getline(1) == 'foo  bar'
    end

    it 'selects the innermost container'
        put! = 'foo {[(1, 2, 3)]} bar'
        normal! 9|
        normal daj
        Expect getline(1) == 'foo {[]} bar'
    end

    it 'selects the counted number of containers'
        put! = 'foo [{[(1, 2, 3)]}] bar'
        normal! 9|
        normal d3aj
        Expect getline(1) == 'foo [] bar'
    end
end
