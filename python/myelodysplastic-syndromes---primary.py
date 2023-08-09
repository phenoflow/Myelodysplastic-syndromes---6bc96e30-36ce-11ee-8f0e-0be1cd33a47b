# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"102712.0","system":"med"},{"code":"104740.0","system":"med"},{"code":"105390.0","system":"med"},{"code":"105915.0","system":"med"},{"code":"105985.0","system":"med"},{"code":"106993.0","system":"med"},{"code":"10817.0","system":"med"},{"code":"14927.0","system":"med"},{"code":"16052.0","system":"med"},{"code":"19130.0","system":"med"},{"code":"22890.0","system":"med"},{"code":"23875.0","system":"med"},{"code":"44420.0","system":"med"},{"code":"45143.0","system":"med"},{"code":"45285.0","system":"med"},{"code":"4561.0","system":"med"},{"code":"56756.0","system":"med"},{"code":"60186.0","system":"med"},{"code":"7799.0","system":"med"},{"code":"94921.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('myelodysplastic-syndromes-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["myelodysplastic-syndromes---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["myelodysplastic-syndromes---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["myelodysplastic-syndromes---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
