export const imagePath = path => typeof window !== 'undefined'
  ? window.__RWR_VIEW_HELPERS__.imagePaths[path] || path
  : global.__RWR_VIEW_HELPERS__.imagePaths[path] || path;
