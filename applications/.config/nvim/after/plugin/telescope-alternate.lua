require('telescope-alternate').setup({
    mappings = {
      { 'namespaces/(.*)/(.*).ts', { { 'namespaces/[1]/[2].test.ts', 'Test', true } } },
      { 'namespaces/(.*)/(.*).tsx', { { 'namespaces/[1]/[2].test.tsx', 'Test', true } } },
      { 'namespaces/(.*)/(.*).test.(.*)', { { 'namespaces/[1]/[2].[3]', 'Implementation', true } } },
    },
  })

