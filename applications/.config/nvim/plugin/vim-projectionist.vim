let g:projectionist_heuristics = {
      \  "*.ts": {
      \    "alternate": "{dirname}/test.ts",
      \    "type": "source"
      \  },
      \  "*/test.ts": {
      \    "alternate": "{}/index.ts",
      \    "type": "test"
      \  },
      \  "*.tsx": {
      \    "alternate": "{dirname}/test.tsx",
      \    "type": "source"
      \  },
      \  "*/test.tsx": {
      \    "alternate": "{}/{basename}.tsx",
      \    "type": "test"
      \  }
      \}

