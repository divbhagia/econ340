from bs4 import BeautifulSoup

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
