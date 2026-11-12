FROM node:22-slim

RUN apt-get update -y && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

RUN npm install -g @azure-devops/mcp@latest supergateway

ENV NODE_ENV=production

CMD ["sh","-c","supergateway --stdio 'npx -y @azure-devops/mcp EcoHub -d core work work-items --authentication pat' --outputTransport streamableHttp --port ${PORT:-10000} --host 0.0.0.0 --apiKey ${API_KEY}"]
