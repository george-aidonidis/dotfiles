let g:projectionist_heuristics = {
      \  "*.tsx": {
      \    "alternate": "{dirname}/test.tsx",
      \    "type": "source"
      \  },
      \  "*/test.tsx": {
      \    "alternate": "{}/{basename}.tsx",
      \    "type": "test"
      \  }
      \}
