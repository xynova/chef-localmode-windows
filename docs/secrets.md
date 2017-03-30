# Handling secrets
To encrypt databags You will use these to encrypt and decrypt databag items.
Each node should then have it's secrets file in a directory where the recipe can find it and use it to decrypt the databag items.

Example:

```
$ echo "s0M3S3cr3T-KeI" > dev.ignore.txt
$ echo "another-S3cr3T-KeI" > test.ignore.txt
```

```
$ cat dev.ingore.txt
s0M3S3cr3T-KeI
```


Then you can create or edit databags items per environment as shown below:

```
# knife data bag create <DATABAG_FOLDER_NAME> <DATA_BAG_ITEM_NAME> --secret-file dev.ingore.txt
# knife data bag edit <DATABAG_FOLDER_NAME> <DATA_BAG_ITEM_NAME> --secret-file dev.ingore.txt
```

## Creating and editing encrypted databags:

```
$ knife data bag create my_secrets_bag my_secret_attributes --secret-file dev.ignore.txt
```

Fill in the attributes you want to encrypt:

```
{
  "id": "my_secret_attributes",
  "name": "James",
  "surname": "Bond",
  "employeeId": "007"
}
```

This will then create the databag item in the data_bags directory in the current repo.
```
{
  "id": "my_secret_attributes",
  "name": {
    "encrypted_data": "hWg/OxECeK6bUnlC84hJGGl2sBk2GBgu7URcnIbZVgQ=\n",
    "iv": "frlQ8dWLusSb0/Mm8vN9FQ==\n",
    "version": 1,
    "cipher": "aes-256-cbc"
  },
  "surname": {
    "encrypted_data": "WaOz9reQfP2eFxpOsRDNgg8p68FKl8c412qI7Eju24E=\n",
    "iv": "GdMW5lPD4NUWmntTOmUOzA==\n",
    "version": 1,
    "cipher": "aes-256-cbc"
  },
  "employeeId": {
    "encrypted_data": "JwmdKNoprLVrBZoJh58GWWWR3KGq+vOgJgd23W9ju/w=\n",
    "iv": "6zDRs0nr9ovsPQw5NguvwA==\n",
    "version": 1,
    "cipher": "aes-256-cbc"
  }
}
```


To edit you can do the following
```
$ knife data bag edit my_secrets_bag my_secret_attributes --secret-file dev.ignore.txt
```



## Consuming encrypted databags:

Make sure you make the secret available to the node.

Then in the recipe you can read the secrets as follows:

```
my_secret_attributes = data_bag_item('my_secrets_bag', 'my_secret_attributes', IO.read('path/to/secret/file.txt'))

log "#{my_secret_attributes['name']} #{my_secret_attributes['surname']} #{my_secret_attributes['employeeId']}"
```

**NOTE:** Make sure your file doesn't have any extra lines in it.