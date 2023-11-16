module.exports = {
  apps: [
    {
      name: 'aws-nest-api',
      script: 'dist/main.js',
      autorestart: true,
      watch: false,
      instances: 1,
      exec_mode: 'cluster',
    },
  ],
};
