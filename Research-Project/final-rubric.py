import pandas as pd
from IPython.display import display, HTML
from RowSpan import row_span
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
