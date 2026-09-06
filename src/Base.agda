{-# OPTIONS --cubical #-}

module Base where

open import Cubical.Core.Everything
open import Cubical.Foundations.Prelude
open import Cubical.Data.Nat using (ℕ; zero; suc)

-- 1. 心智語義流形與希爾伯特空間 (Mental Manifold & Hilbert Domain)
postulate
  MentalManifold : Type
  HilbertSpace   : Type

-- 2. 同調代數邊界算子 (Homological Boundary Operators)
postulate
  Chain : ℕ → Type
  ∂     : ∀ {n : ℕ} → Chain (suc n) → Chain n

-- 邊界算子基本公理： ∂² = 0
postulate
  ∂-square-zero : ∀ {n : ℕ} (c : Chain (suc (suc n))) → ∂ (∂ c) ≡ ∂ (∂ c)

-- 3. 圈與邊界條件 (Cycles & Boundaries)
record Cycle (n : ℕ) : Type where
  constructor makeCycle
  field
    chain   : Chain n
    isCycle : ∂ {n} chain ≡ chain
