// Name: Jordan Lew

// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// 
// Name: Jordan Lew

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// ===================================================================================

// Select the BigRig Movers database
// with your authcate username

//use("abc001");
use("bigrig_movers")
// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Remove the existing collection before recreating it,
// ensuring the MongoDB collection starts with a clean dataset.
// Drop collection
db.customerQuotes.drop();

// Create a collection containing the JSON customer documents
// generated from the BRM Oracle database.
// The documents store customer details, customer-level statistics
// and an embedded array containing each customer's quotes and jobs.
db.customerQuotes.insertMany([
    {"_id":1,"customer_name":"Michael Benjamin","customer_business":"FreshBox","customer_address":"55 Lonsdale Street, Melbourne, 3008","customer_phone":"0478901017","customer_stats":{"number_of_quotes":5,"number_of_jobs":5,"total_paid_jobcost":"   $1,200.00","total_unpaid_jobcost":"   $5,900.00"},"quotes":[{"quote_no":1,"quote_prepared_on":"05-May-2026","preferred_start_date":"10-May-2026","start_location":"Melbourne","end_location":"Sydney","quote_cost":"   $1,200.00","assigned_to_job":"Y","job_cost":"   $1,200.00"},{"quote_no":18,"quote_prepared_on":"22-May-2026","preferred_start_date":"27-May-2026","start_location":"Perth","end_location":"Sydney","quote_cost":"   $1,700.00","assigned_to_job":"Y","job_cost":"   $1,700.00"},{"quote_no":13,"quote_prepared_on":"17-May-2026","preferred_start_date":"22-May-2026","start_location":"Sydney","end_location":"Brisbane","quote_cost":"   $1,300.00","assigned_to_job":"Y","job_cost":"   $1,300.00"},{"quote_no":8,"quote_prepared_on":"12-May-2026","preferred_start_date":"17-May-2026","start_location":"Sydney","end_location":"Melbourne","quote_cost":"   $1,400.00","assigned_to_job":"Y","job_cost":"   $1,400.00"},{"quote_no":3,"quote_prepared_on":"07-May-2026","preferred_start_date":"12-May-2026","start_location":"Brisbane","end_location":"Melbourne","quote_cost":"   $1,500.00","assigned_to_job":"Y","job_cost":"   $1,500.00"}]},
    {"_id":2,"customer_name":"James ","customer_business":"J Wood and Gravel","customer_address":"15 George Street, Sydney, 2000","customer_phone":"0412345001","customer_stats":{"number_of_quotes":5,"number_of_jobs":5,"total_paid_jobcost":"   $7,300.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":2,"quote_prepared_on":"06-May-2026","preferred_start_date":"11-May-2026","start_location":"Perth","end_location":"Adelaide","quote_cost":"     $900.00","assigned_to_job":"Y","job_cost":"     $900.00"},{"quote_no":19,"quote_prepared_on":"23-May-2026","preferred_start_date":"28-May-2026","start_location":"Melbourne","end_location":"Adelaide","quote_cost":"   $1,000.00","assigned_to_job":"Y","job_cost":"   $1,000.00"},{"quote_no":14,"quote_prepared_on":"18-May-2026","preferred_start_date":"23-May-2026","start_location":"Melbourne","end_location":"Perth","quote_cost":"   $1,800.00","assigned_to_job":"Y","job_cost":"   $1,800.00"},{"quote_no":9,"quote_prepared_on":"13-May-2026","preferred_start_date":"18-May-2026","start_location":"Brisbane","end_location":"Perth","quote_cost":"   $1,600.00","assigned_to_job":"Y","job_cost":"   $1,600.00"},{"quote_no":4,"quote_prepared_on":"08-May-2026","preferred_start_date":"13-May-2026","start_location":"Sydney","end_location":"Perth","quote_cost":"   $2,000.00","assigned_to_job":"Y","job_cost":"   $2,000.00"}]},
    {"_id":3,"customer_name":" Brook","customer_business":"Western Chocolatery","customer_address":"23 Murray Street, Perth, 6000","customer_phone":"0445678004","customer_stats":{"number_of_quotes":4,"number_of_jobs":4,"total_paid_jobcost":"   $1,600.00","total_unpaid_jobcost":"   $3,600.00"},"quotes":[{"quote_no":5,"quote_prepared_on":"09-May-2026","preferred_start_date":"14-May-2026","start_location":"Adelaide","end_location":"Sydney","quote_cost":"   $1,100.00","assigned_to_job":"Y","job_cost":"   $1,100.00"},{"quote_no":20,"quote_prepared_on":"24-May-2026","preferred_start_date":"29-May-2026","start_location":"Brisbane","end_location":"Perth","quote_cost":"   $1,600.00","assigned_to_job":"Y","job_cost":"   $1,600.00"},{"quote_no":15,"quote_prepared_on":"19-May-2026","preferred_start_date":"24-May-2026","start_location":"Brisbane","end_location":"Sydney","quote_cost":"   $1,500.00","assigned_to_job":"Y","job_cost":"   $1,500.00"},{"quote_no":10,"quote_prepared_on":"14-May-2026","preferred_start_date":"19-May-2026","start_location":"Adelaide","end_location":"Melbourne","quote_cost":"   $1,000.00","assigned_to_job":"Y","job_cost":"   $1,000.00"}]},
    {"_id":4,"customer_name":"Alexander Noah","customer_business":"-","customer_address":"56 Bourke Street, Melbourne, 3001","customer_phone":"0478901007","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"   $3,600.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":6,"quote_prepared_on":"10-May-2026","preferred_start_date":"15-May-2026","start_location":"Melbourne","end_location":"Brisbane","quote_cost":"   $1,300.00","assigned_to_job":"Y","job_cost":"   $1,300.00"},{"quote_no":16,"quote_prepared_on":"20-May-2026","preferred_start_date":"25-May-2026","start_location":"Adelaide","end_location":"Brisbane","quote_cost":"   $1,100.00","assigned_to_job":"Y","job_cost":"   $1,100.00"},{"quote_no":11,"quote_prepared_on":"15-May-2026","preferred_start_date":"20-May-2026","start_location":"Melbourne","end_location":"Sydney","quote_cost":"   $1,200.00","assigned_to_job":"Y","job_cost":"   $1,200.00"}]},
    {"_id":5,"customer_name":"Jack Ethan","customer_business":"-","customer_address":"61 Ann Street, Brisbane, 4101","customer_phone":"0434567013","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"   $4,000.00","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":7,"quote_prepared_on":"11-May-2026","preferred_start_date":"16-May-2026","start_location":"Perth","end_location":"Sydney","quote_cost":"   $1,700.00","assigned_to_job":"Y","job_cost":"   $1,700.00"},{"quote_no":17,"quote_prepared_on":"21-May-2026","preferred_start_date":"26-May-2026","start_location":"Sydney","end_location":"Melbourne","quote_cost":"   $1,400.00","assigned_to_job":"Y","job_cost":"   $1,400.00"},{"quote_no":12,"quote_prepared_on":"16-May-2026","preferred_start_date":"21-May-2026","start_location":"Perth","end_location":"Adelaide","quote_cost":"     $900.00","assigned_to_job":"Y","job_cost":"     $900.00"}]},
    {"_id":6,"customer_name":"Sophie Amelia","customer_business":"-","customer_address":"29 Barrack Street, Perth, 6009","customer_phone":"0445678014","customer_stats":{"number_of_quotes":2,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":21,"quote_prepared_on":"25-May-2026","preferred_start_date":"30-May-2026","start_location":"Sydney","end_location":"Brisbane","quote_cost":"   $1,300.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":26,"quote_prepared_on":"30-May-2026","preferred_start_date":"04-Jun-2026","start_location":"Brisbane","end_location":"Melbourne","quote_cost":"   $1,500.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":7,"customer_name":"Kate Evelyn","customer_business":"Miller Co.","customer_address":"72 Cavill Avenue, Brisbane, 4217","customer_phone":"0489012018","customer_stats":{"number_of_quotes":2,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":27,"quote_prepared_on":"01-Jun-2026","preferred_start_date":"05-Jun-2026","start_location":"Perth","end_location":"Sydney","quote_cost":"   $1,700.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":22,"quote_prepared_on":"26-May-2026","preferred_start_date":"31-May-2026","start_location":"Perth","end_location":"Melbourne","quote_cost":"   $1,800.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":8,"customer_name":"Emma ","customer_business":"Kreate Curtain","customer_address":"42 Collins Street, Melbourne, 3000","customer_phone":"0423456002","customer_stats":{"number_of_quotes":2,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":23,"quote_prepared_on":"27-May-2026","preferred_start_date":"01-Jun-2026","start_location":"Adelaide","end_location":"Sydney","quote_cost":"   $1,100.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":28,"quote_prepared_on":"02-Jun-2026","preferred_start_date":"06-Jun-2026","start_location":"Melbourne","end_location":"Perth","quote_cost":"   $1,800.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":9,"customer_name":" William","customer_business":"Best Fruit and Veg","customer_address":"67 King William Street, Adelaide, 5000","customer_phone":"0456789005","customer_stats":{"number_of_quotes":2,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":29,"quote_prepared_on":"03-Jun-2026","preferred_start_date":"07-Jun-2026","start_location":"Sydney","end_location":"Brisbane","quote_cost":"   $1,300.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":24,"quote_prepared_on":"28-May-2026","preferred_start_date":"02-Jun-2026","start_location":"Melbourne","end_location":"Brisbane","quote_cost":"   $1,200.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":10,"customer_name":"Grace","customer_business":"-","customer_address":"45 Rundle Mall, Adelaide, 5006","customer_phone":"0401234010","customer_stats":{"number_of_quotes":2,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":30,"quote_prepared_on":"04-Jun-2026","preferred_start_date":"08-Jun-2026","start_location":"Adelaide","end_location":"Melbourne","quote_cost":"   $1,000.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":25,"quote_prepared_on":"29-May-2026","preferred_start_date":"03-Jun-2026","start_location":"Sydney","end_location":"Perth","quote_cost":"   $2,000.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":11,"customer_name":"Rose Isabella","customer_business":"-","customer_address":"34 Adelaide Street, Brisbane, 4006","customer_phone":"0489012008","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":12,"customer_name":"Robert James","customer_business":"Wilson Confectionery","customer_address":"38 Wellington Street, Perth, 6107","customer_phone":"0490123019","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":13,"customer_name":"Oliver ","customer_business":"Williams Co.","customer_address":"88 Queen Street, Brisbane, 4000","customer_phone":"0434567003","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":14,"customer_name":" Price","customer_business":"Garcia Frozen","customer_address":"101 Pitt Street, Sydney, 2010","customer_phone":"0467890006","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":15,"customer_name":"Thomas","customer_business":"-","customer_address":"78 Hay Street, Perth, 6003","customer_phone":"0490123009","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":16,"customer_name":"Henry Lucas","customer_business":"-","customer_address":"92 Oxford Street, Sydney, 2060","customer_phone":"0412345011","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":17,"customer_name":"Lily Charlotte","customer_business":"-","customer_address":"18 Chapel Street, Melbourne, 3004","customer_phone":"0423456012","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":18,"customer_name":"Victoria Ella","customer_business":"Flintstone Store","customer_address":"94 Henley Beach Road, Adelaide, 5095","customer_phone":"0401234020","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":300,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"29 Kuranda Road, Adelaide SA 5030","end_location":"9 Albatros Drive, Mount Gambier SA 5270","quote_cost":"   $1,000.00","assigned_to_job":"N","job_cost":"-"}]},
    {"_id":19,"customer_name":"Daniel Mason","customer_business":"-","customer_address":"83 Jetty Road, Adelaide, 5063","customer_phone":"0456789015","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]},
    {"_id":20,"customer_name":"Emily Harper","customer_business":"-","customer_address":"127 Parramatta Road, Sydney, 2150","customer_phone":"0467890016","customer_stats":{"number_of_quotes":0,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":null,"quote_prepared_on":null,"preferred_start_date":null,"start_location":null,"end_location":null,"quote_cost":null,"assigned_to_job":"N","job_cost":"-"}]}
    ]);

// Display the complete customer documents after insertion
// to verify that the MongoDB collection was populated correctly.
// List all documents you added
db.customerQuotes.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Find customers who have made at least two quotes and whose
// address contains Melbourne. The projection limits the output
// to the customer identification, contact details and statistics
// requested for this analysis.
db.customerQuotes.find(
  {
    "customer_address": { $regex: "Melbourne" },   // filter by Melbourne in address
    "customer_stats.number_of_quotes": { $gte: 2 } // at least 2 quotes
  },
  {
    _id: 1,
    customer_name: 1,
    customer_address: 1,
    customer_phone: 1,
    "customer_stats.number_of_quotes": 1,
    "customer_stats.number_of_jobs": 1,
    "customer_stats.total_paid_jobcost": 1,
    "customer_stats.total_unpaid_jobcost": 1
  }
);


// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i) Add the new customer
// Insert Patrick Bosse with customer ID 1001 and initialise
// their quote and job statistics before any quotes are recorded.
db.customerQuotes.insertOne({
  _id: NumberInt(1001),
  customer_name: "Patrick Bosse",
  customer_business: "BigRig Movers",
  customer_address: "12 King Street, Adelaide, 5000",
  customer_phone: "0409876543",
  customer_stats: {
    number_of_quotes: NumberInt(0),
    number_of_jobs: NumberInt(0),
    total_paid_jobcost: "-",
    total_unpaid_jobcost: "-"
  },
  quotes: []
});

// Confirm that the newly inserted customer's details
// are stored correctly in the MongoDB collection.
// Show the customer details
db.customerQuotes.find({ _id: 1001 });

// (ii) Add new quote
// Update Patrick Bosse's customer document with their first quote.
// The quote is immediately assigned to a job, has the same
// $3,200.00 job cost, and is recorded as fully paid.
db.customerQuotes.updateOne(
  { _id: 1001 },
  {
    $set: {
      "customer_stats.number_of_quotes": NumberInt(1),
      "customer_stats.number_of_jobs": NumberInt(1),
      "customer_stats.total_paid_jobcost": "$3,200.00",
      "customer_stats.total_unpaid_jobcost": "-"
    },
    $push: {
      quotes: {
        quote_no: NumberInt(2002),
        quote_prepared_on: "10-Jun-2026",
        preferred_start_date: "15-Jun-2026",
        start_location: "Adelaide SA",
        end_location: "Melbourne VIC",
        quote_cost: "$3,200.00",
        assigned_to_job: "Y",
        job_cost: "$3,200.00"
      }
    }
  }
);

// Confirm that Patrick's customer statistics and new quote
// have been added successfully after the update.
// Show the customer details
db.customerQuotes.find({ _id: 1001 });

// End of file - do not remove