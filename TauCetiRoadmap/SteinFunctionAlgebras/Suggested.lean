/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti contributors
-/
import Mathlib
import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Basic
import TauCeti.Geometry.Manifold.ContMDiff.Analytic

/-!
# Stein function algebras: target signatures

**This file is not the roadmap.** The roadmap is `README.md`, which is the definitive
specification; this file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti APIs, each with `sorry`, and is read as suggested forms, never as an exhaustive checklist.

Stated here:

* the Remmert–Narasimhan embedding (README §1.1),
  `exists_proper_holomorphic_embedding_of_isStein`;
* Hadamard division and the Euclidean character lemma (README §§2.0–2.1),
  `character_eq_eval_of_euclidean`;
* the Stein character theorem (README §2.2), `character_eq_eval_of_isStein`;
* pullback of holomorphic functions (README §3.1), `pullbackAlgHom`;
* automatic holomorphy (README §3.2), `exists_unique_holomorphicMap_of_algHom`;
* full faithfulness of the global-section functor (README §3.3),
  `bijective_pullbackAlgHom`;
* algebra isomorphisms versus biholomorphisms (README §3.3),
  `nonempty_algEquiv_iff_nonempty_biholomorphism`;
* the Gelfand reconstruction theorem (README §5.2), `exists_homeomorph_characterSpace`, with
  `CharacterSpace` carrying the initial topology of the evaluation maps.

Not stated here:

* Cousin II (README Layer 4): the pins have no sheaf of units `O^*`, no sheaf cohomology group
  `H¹(X, O^*)`, no Picard group of holomorphic line bundles and no meromorphic function sheaf;
  these are ComplexKahlerGeometry K4.P and ComplexManifolds §7.3 targets. The theorem is stated in
  the roadmap against that API.
* the countability and separation hypotheses of the embedding are explicit in the signatures below;
  the prototype does not prove the Stein criterion or the Cartan theorems it consumes.

The pinned Tau Ceti predates `TauCeti.IsSteinManifold`, so the file defines `IsStein` locally with
the same three axioms as SF0. When the pin advances, the local definition is replaced by the
library class and the rest of the file is unchanged.
-/

noncomputable section

open CategoryTheory Opposite Set TopologicalSpace
open scoped ContDiff Manifold Topology

namespace TauCetiRoadmap.SteinFunctionAlgebras

/-! ## SF0: the Stein predicate and the holomorphic hull -/

/-- The holomorphic hull of a set `K` in a complex manifold `X`: the points `x` at which every
global holomorphic function satisfies every modulus bound it satisfies on `K`. This is
`TauCeti.mholomorphicHull` when the library declaration is available. -/
def holomorphicHull {E X : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] (K : Set X) : Set X :=
  {x | ∀ f : X → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) f → ∀ B : ℝ,
    (∀ y ∈ K, ‖f y‖ ≤ B) → ‖f x‖ ≤ B}

/-- A complex manifold is Stein when it is holomorphically convex, global holomorphic functions
separate points, and at every point some global holomorphic map to the model has injective
differential. This is the three-axiom predicate of README Definition 0.3. -/
def IsStein (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] (X : Type*)
    [TopologicalSpace X] [ChartedSpace E X] : Prop :=
  (∀ K : Set X, IsCompact K → IsCompact (holomorphicHull (E := E) K)) ∧
    (∀ x y : X, x ≠ y → ∃ f : X → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ) f ∧ f x ≠ f y) ∧
    ∀ x : X, ∃ F : X → E, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ, E) F ∧
      Function.Injective (mfderiv 𝓘(ℂ, E) 𝓘(ℂ, E) F x)

/-! ## The function algebra and evaluation -/

/-- The complex algebra of global holomorphic functions on `X`, as the top sections of Tau Ceti's
holomorphic structure sheaf. -/
noncomputable abbrev HolFunctions (E X : Type) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] : Type :=
  ↥((TauCeti.holomorphicStructureSheaf (𝓘(ℂ, E)) X).presheaf.obj (op ⊤))

/-- Evaluation of a global holomorphic function at a point, as a unital complex-algebra
homomorphism. -/
noncomputable def evalAt {E X : Type} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] (x : X) :
    HolFunctions E X →ₐ[ℂ] ℂ where
  toFun f := (f : ↥(⊤ : Opens X) → ℂ) ⟨x, trivial⟩
  map_one' := by simp
  map_zero' := by simp
  map_add' f g := by simp
  map_mul' f g := by simp
  commutes' c := by simp

/-- The character space of the function algebra, with the Gelfand topology: the initial topology
induced by the evaluation maps `φ ↦ φ f`, for `f : O(X)`. -/
abbrev CharacterSpace (E X : Type) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] : Type :=
  HolFunctions E X →ₐ[ℂ] ℂ

namespace CharacterSpace

instance instTopologicalSpace {E X : Type} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace X] [ChartedSpace E X] : TopologicalSpace (CharacterSpace E X) :=
  TopologicalSpace.induced (fun φ : CharacterSpace E X => fun f : HolFunctions E X => φ f)
    Pi.topologicalSpace

end CharacterSpace

/-! ## SF1: the Remmert–Narasimhan embedding -/

/-- **The Remmert–Narasimhan embedding** (README Theorem 1.1). A Stein manifold of complex
dimension `n` has a proper holomorphic embedding into `ℂ^N` with `N ≤ 2n + 1`, whose differential
is injective at every point. -/
theorem exists_proper_holomorphic_embedding_of_isStein {n : ℕ} {X : Type}
    [TopologicalSpace X] [T2Space X] [SecondCountableTopology X]
    [ChartedSpace (Fin n → ℂ) X] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ X]
    (hX : IsStein (Fin n → ℂ) X) :
    ∃ (N : ℕ) (_hN : N ≤ 2 * n + 1) (f : X → (Fin N → ℂ)),
      ContMDiff 𝓘(ℂ, Fin n → ℂ) 𝓘(ℂ, Fin N → ℂ) ω f ∧
      Function.Injective f ∧ IsProperMap f ∧
      (∀ x, Function.Injective (mfderiv 𝓘(ℂ, Fin n → ℂ) 𝓘(ℂ, Fin N → ℂ) f x)) := by
  sorry

/-! ## SF2: characters -/

/-- **The Euclidean character lemma** (README Lemmas 2.0–2.1). Every unital complex-algebra
homomorphism `O(ℂ^N) → ℂ` is evaluation at a unique point. -/
theorem character_eq_eval_of_euclidean {N : ℕ}
    (φ : HolFunctions (Fin N → ℂ) (Fin N → ℂ) →ₐ[ℂ] ℂ) :
    ∃! a : Fin N → ℂ, φ = evalAt a := by
  sorry

/-- **The Stein character theorem** (README Theorem 2.2). Every unital complex-algebra
homomorphism `O(X) → ℂ` on a Stein manifold is evaluation at a unique point. -/
theorem character_eq_eval_of_isStein {n : ℕ} {X : Type}
    [TopologicalSpace X] [T2Space X] [SecondCountableTopology X]
    [ChartedSpace (Fin n → ℂ) X] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ X]
    (hX : IsStein (Fin n → ℂ) X) (φ : HolFunctions (Fin n → ℂ) X →ₐ[ℂ] ℂ) :
    ∃! x : X, φ = evalAt x := by
  sorry

/-! ## SF3: pullback and automatic holomorphy -/

/-- Precomposition with a holomorphic map, as a unital complex-algebra homomorphism of global
holomorphic functions. -/
noncomputable def pullbackAlgHom {E F X Y : Type} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] [TopologicalSpace X] [ChartedSpace E X]
    [TopologicalSpace Y] [ChartedSpace F Y] (f : X → Y)
    (hf : ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, F) ω f) :
    HolFunctions F Y →ₐ[ℂ] HolFunctions E X := by
  sorry

/-- **Automatic holomorphy** (README Theorem 3.2). For a complex manifold `X` and a Stein manifold
`Y`, every unital complex-algebra homomorphism `O(Y) → O(X)` is pullback along a unique
holomorphic map `X → Y`. -/
theorem exists_unique_holomorphicMap_of_algHom {m n : ℕ} {X Y : Type}
    [TopologicalSpace X] [T2Space X]
    [ChartedSpace (Fin m → ℂ) X] [IsManifold 𝓘(ℂ, Fin m → ℂ) ∞ X]
    [TopologicalSpace Y] [T2Space Y] [SecondCountableTopology Y]
    [ChartedSpace (Fin n → ℂ) Y] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ Y]
    (hY : IsStein (Fin n → ℂ) Y)
    (φ : HolFunctions (Fin n → ℂ) Y →ₐ[ℂ] HolFunctions (Fin m → ℂ) X) :
    ∃! f : {f : X → Y // ContMDiff 𝓘(ℂ, Fin m → ℂ) 𝓘(ℂ, Fin n → ℂ) ω f},
      φ = pullbackAlgHom f.1 f.2 := by
  sorry

/-- **Full faithfulness** (README Corollary 3.3). On Stein manifolds, pullback is a bijection
between holomorphic maps and unital complex-algebra homomorphisms of the function algebras. -/
theorem bijective_pullbackAlgHom {m n : ℕ} {X Y : Type}
    [TopologicalSpace X] [T2Space X] [SecondCountableTopology X]
    [ChartedSpace (Fin m → ℂ) X] [IsManifold 𝓘(ℂ, Fin m → ℂ) ∞ X]
    [TopologicalSpace Y] [T2Space Y] [SecondCountableTopology Y]
    [ChartedSpace (Fin n → ℂ) Y] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ Y]
    (hX : IsStein (Fin m → ℂ) X) (hY : IsStein (Fin n → ℂ) Y) :
    Function.Bijective (fun f : {f : X → Y // ContMDiff 𝓘(ℂ, Fin m → ℂ) 𝓘(ℂ, Fin n → ℂ) ω f} =>
      pullbackAlgHom f.1 f.2) := by
  sorry

/-- A biholomorphism between complex manifolds, as a holomorphic map with a holomorphic inverse. -/
structure Biholomorphism {m n : ℕ} (X Y : Type) [TopologicalSpace X]
    [ChartedSpace (Fin m → ℂ) X] [TopologicalSpace Y] [ChartedSpace (Fin n → ℂ) Y] where
  /-- The forward map. -/
  toFun : X → Y
  /-- The inverse map. -/
  invFun : Y → X
  /-- The inverse is a left inverse. -/
  left_inv : Function.LeftInverse invFun toFun
  /-- The inverse is a right inverse. -/
  right_inv : Function.RightInverse invFun toFun
  /-- The forward map is holomorphic. -/
  contMDiff_toFun : ContMDiff 𝓘(ℂ, Fin m → ℂ) 𝓘(ℂ, Fin n → ℂ) ω toFun
  /-- The inverse map is holomorphic. -/
  contMDiff_invFun : ContMDiff 𝓘(ℂ, Fin n → ℂ) 𝓘(ℂ, Fin m → ℂ) ω invFun

/-- **Algebra isomorphisms versus biholomorphisms** (README Corollary 3.4). For Stein manifolds,
`O(X)` and `O(Y)` are isomorphic complex algebras exactly when `X` and `Y` are biholomorphic. -/
theorem nonempty_algEquiv_iff_nonempty_biholomorphism {m n : ℕ} {X Y : Type}
    [TopologicalSpace X] [T2Space X] [SecondCountableTopology X]
    [ChartedSpace (Fin m → ℂ) X] [IsManifold 𝓘(ℂ, Fin m → ℂ) ∞ X]
    [TopologicalSpace Y] [T2Space Y] [SecondCountableTopology Y]
    [ChartedSpace (Fin n → ℂ) Y] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ Y]
    (hX : IsStein (Fin m → ℂ) X) (hY : IsStein (Fin n → ℂ) Y) :
    Nonempty (HolFunctions (Fin n → ℂ) Y ≃ₐ[ℂ] HolFunctions (Fin m → ℂ) X) ↔
      Nonempty (Biholomorphism (m := m) (n := n) X Y) := by
  sorry

/-! ## SF5: reconstruction -/

/-- **Reconstruction of the manifold** (README Theorem 5.2). For a Stein manifold `X`, evaluation
at points is a homeomorphism from `X` onto the character space of `O(X)` with the Gelfand
topology. -/
theorem exists_homeomorph_characterSpace {n : ℕ} {X : Type}
    [TopologicalSpace X] [T2Space X] [SecondCountableTopology X]
    [ChartedSpace (Fin n → ℂ) X] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ X]
    (hX : IsStein (Fin n → ℂ) X) :
    ∃ e : X ≃ₜ CharacterSpace (Fin n → ℂ) X,
      ∀ x, e x = evalAt x := by
  sorry

end TauCetiRoadmap.SteinFunctionAlgebras
