const mongoS3 = require('mongo-s3');

mongoS3({
  log: console.log,
  uri: process.env.MONGO_URI,
  s3: {
      accessKeyId: process.env.AWS_ACCESS_KEY_ID,
      secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
      bucket: process.env.AWS_S3_DUMP_BUCKET,
      key: `ajintel-db-backup-${new Date().toISOString().slice(0, 10)}`
  }
}).then(function (result) { console.log('Done') })
  .catch(function (err) { console.error('Error', err) });