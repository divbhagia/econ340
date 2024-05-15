import pandas as pd
from IPython.display import display, HTML
from bs4 import BeautifulSoup

########################################################################
# Helper function
########################################################################

def row_span(html_content, target_text, rowspan_count):

    # Parse the HTML
    soup = BeautifulSoup(html_content, 'html.parser')

    # Find the <td> element to modify
    td_to_modify = soup.find('td', string=target_text)

    # Check if the element was found
    if td_to_modify:
        # Set it to span the specified number of rows
        td_to_modify['rowspan'] = str(rowspan_count)
        
        # Remove the first <td> in the next rows covered by the rowspan
        parent_tr = td_to_modify.find_parent('tr')
        for _ in range(rowspan_count - 1):  # Adjust for the next rows
            next_tr = parent_tr.find_next_sibling('tr')
            if next_tr:
                first_td = next_tr.find('td')
                if first_td:
                    first_td.decompose()  # Remove the <td>
                parent_tr = next_tr

    return str(soup)

########################################################################

dir = "./Research-Project"

# Define custom class for table
custom_css = """
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,700&display=swap);

.my-table {
    display: block;
    overflow-y: auto;
    height: 800px; 
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #b7b7b7;
}
table.my-table, table.my-table th, table.my-table td {
    font-family: Lato;
}

.my-table td {
    border: 1px solid #b7b7b7; 
    padding: 8px; 
    text-align: left; 
}

.my-table th {
    border: 1px solid #b7b7b7; 
    padding: 8px; 
    text-align: center; 
}

.my-table thead th {
    border: 1px solid #b7b7b7; 
    position: sticky;
    top: 0;
    background-color: #ddd; 
    z-index: 2;
}

# Columns
.my-table td:nth-child(1), .my-table th:nth-child(1) { width: 10%; } 
.my-table td:nth-child(2), .my-table th:nth-child(1) { width: 27%; } 
.my-table td:nth-child(3), .my-table th:nth-child(1) { width: 20%; } 
.my-table td:nth-child(4), .my-table th:nth-child(1) { width: 18%; } 
.my-table td:nth-child(5), .my-table th:nth-child(1) { width: 18%; } 

</style>
"""
# Load and save rubric as html
df = pd.read_excel(f'{dir}/final-rubric.xlsx', dtype=str)
html_table = df.to_html(escape=False, index=False, na_rep='', classes='my-table')
html_table = row_span(html_table, 'Introduction (15 points)', 3)
html_table = row_span(html_table, 'Literature Review (10 points)', 2)
html_table = row_span(html_table, 'Descriptive Analysis (15 points)', 3)
html_table = row_span(html_table, 'Empirical Strategy (15 points)', 3)
html_table = row_span(html_table, 'Results and Analysis (25 points)', 5)
html_table = row_span(html_table, 'Conclusion (10 points)', 2)
html_table = row_span(html_table, 'Format and Coherence (10 points)', 2)
html_table = row_span(html_table, 'Writing and Grammar (10 points)', 3)
full_html = custom_css + html_table
with open(f'{dir}/final-rubric.html', 'w', encoding='utf-8') as f:
    f.write(full_html)
