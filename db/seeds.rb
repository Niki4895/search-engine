# data = [['p1', 'this is page 1 with keywords', 'fords, cars, review'],
# ['p2', 'this is page 2 with keywords', 'toyoto, cars'],
# ['p3', 'this is page 3 with keywords', 'cars, fords']]

data = [['p1', 'this is page 1 with keywords', 'fords, cars, review'],
['p2', 'this is page 2 with keywords', 'review, cars'],
['p3', 'this is page 3 with keywords', 'review, fords'],
['p4', 'this is page 4 with keywords', 'toyoto, cars'],
['p5', 'this is page 5 with keywords', 'honda, cars'],
['p6', 'this is page 6 with keywords', 'cars']]

data.each do |d|
    page = Page.new(title: d[0], content: "#{d[1]}  #{d[2]}")
    if page.save
        count = 8
        d[2].split(', ').each_with_index do |k, index|
            page.keywords.create(priority: count, name: k, index_val: index)
            count -= 1
        end
    end
end
