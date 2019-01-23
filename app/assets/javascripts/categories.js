$(document).on('turbolinks:load', function(){
    var articles = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
        url: '/groups/test/categories/autocomplete?query=%QUERY',
        wildcard: '%QUERY'
        }
    });
    $('#articles_search').typeahead(null, {
        source: articles
    });
})