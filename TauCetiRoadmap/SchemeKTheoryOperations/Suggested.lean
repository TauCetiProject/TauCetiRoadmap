import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable

/-!
# K-theory of schemes, localisation and operations: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems that are statable against the
pinned Mathlib and Tau Ceti (Mathlib 1b1ccf4, Tau Ceti 2fd255d), each with `sorry`; proving
them finishes neither a layer nor the roadmap.

Stated here:

* §1.6, the global strict-representative theorem: on a qcqs scheme with the resolution
  property, every perfect complex is represented in the derived category by a bounded complex
  of finite locally free sheaves. The two predicates express strict perfectness and the
  elementary local perfectness criterion on Mathlib's complexes of module sheaves. The
  resolution property is written directly as the finite locally free quotient condition,
  without introducing another predicate.
* §6.7, van der Kallen's homology stability for general linear groups with constant integral
  coefficients, in its Noetherian and semilocal forms, along Tau Ceti's stabilization
  `TauCeti.stabilizeGL`. The rings live in `Type`, the universe of the coefficient ring `ℤ`,
  because Mathlib's `Rep ℤ G` needs the group in that universe. The comparison with the stable
  group `GL(R)` in the same ranges follows from these by §6.7's directed-union identification
  and is not restated.

Not statable at the pins:

* the form of van der Kallen's theorem under Bass's stable range condition `SR_(s+2)`, of
  which the two stated theorems are instances: the pins have no stable-range predicate;
* the other Layer 1 comparisons and finite descent: the enhanced perfect categories and
  complicial/Frobenius models are absent;
* Layers 2–5 require scheme K/G spectra, their supported localisation maps, spectral
  hypercohomology and coniveau towers; the Witt results also need the enhanced perfect
  categories of Witt thickenings. Thus localisation, spectral descent, Gersten exactness and
  Bloch's formula, Witt hyperdescent, and the projective-bundle, Bass and blowup formulas have
  no signatures here;
* the other targets of Layers 6–7 additionally require special λ-ring structures on K-groups,
  higher Adams operations, Chern classes and characters, and comparison maps from K-theory to
  Chow groups. Adams weight decompositions, Chern-character isomorphisms, Riemann–Roch and
  excess intersection remain mathematical targets in the README without compiled statements
  here.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperations

open CategoryTheory CategoryTheory.Limits

universe v u

/-! ## Layer 1: Perfect complexes and their models -/

/-- A globally bounded complex with finite locally free terms (README §1.1,
Thomason–Trobaugh, Definition 2.2.2). The bound is on terms, not cohomology. -/
def IsStrictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  (∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i)) ∧
  ∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
    SheafOfModules.IsFiniteType (E.X i)

/-- Local quasi-isomorphism from strictly perfect complexes (README §1.3,
Stacks, Definition 20.49.1, tag 08CM, and Lemma 20.49.3, tag 0BCJ). -/
def IsPerfectComplex (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧
    ∃ P : CochainComplex (U : AlgebraicGeometry.Scheme).Modules ℤ,
      IsStrictlyPerfect (U : AlgebraicGeometry.Scheme) P ∧
      ∃ f : P ⟶ ((AlgebraicGeometry.Scheme.Modules.restrictFunctor U.ι).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj E, QuasiIso f

/-- On a qcqs scheme with the resolution property, every perfect complex has a
 globally bounded vector-bundle representative in the derived category (README §1.6,
 Stacks, Lemma 36.37.2, tag 0F8F). -/
theorem IsPerfectComplex.exists_strictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    [CompactSpace X] [QuasiSeparatedSpace X] [HasDerivedCategory.{v} X.Modules]
    (hres : ∀ M : X.Modules, SheafOfModules.IsQuasicoherent.{u} M →
      SheafOfModules.IsFiniteType.{u} M → ∃ V : X.Modules,
        SheafOfModules.IsLocallyFree.{u} V ∧ SheafOfModules.IsFiniteType.{u} V ∧
        ∃ f : V ⟶ M, Epi f)
    (E : CochainComplex X.Modules ℤ) (hE : IsPerfectComplex X E) :
    ∃ P : CochainComplex X.Modules ℤ, IsStrictlyPerfect X P ∧
      Nonempty (DerivedCategory.Q.obj P ≅ DerivedCategory.Q.obj E) := by
  sorry

/-! ## Layer 6: Products, λ-operations and Adams weights -/

/-- van der Kallen's homology stability, Noetherian form (README §6.7): for a commutative
Noetherian ring of Krull dimension at most `d`, the stabilization `g ↦ diag(g, 1)` induces a
map `H_m(GL_n(R); ℤ) → H_m(GL_(n+1)(R); ℤ)` that is onto for `n ≥ 2m + max(1, d) − 1` and
bijective for `n ≥ 2m + max(1, d)` (Kal80, Theorem 4.11, p. 289, with `sdim = d` by Bass's
stable range theorem, Kal80, 2.2, p. 273). The coefficient map `φ` is the identity of `ℤ`. -/
theorem groupHomology_stabilizeGL_of_ringKrullDim_le (R : Type) [CommRing R]
    [IsNoetherianRing R] (d m n : ℕ) (hd : ringKrullDim R ≤ d)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : ∀ z : ℤ, φ.hom.toLinearMap z = z) :
    (2 * m + max 1 d ≤ n + 1 → Function.Surjective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) ∧
    (2 * m + max 1 d ≤ n → Function.Bijective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) := by
  sorry

/-- van der Kallen's homology stability, semilocal form (README §6.7): for a ring whose
quotient by its Jacobson radical is semisimple, so that it has stable range one, the
stabilization `g ↦ diag(g, 1)` induces a map `H_m(GL_n(R); ℤ) → H_m(GL_(n+1)(R); ℤ)` that is
onto for `n ≥ 2m` and bijective for `n ≥ 2m + 1` (Kal80, Theorem 4.11, p. 289, with
`sdim = 0`). The ring need not be commutative. The coefficient map `φ` is the identity of
`ℤ`. -/
theorem groupHomology_stabilizeGL_of_isSemisimpleRing (R : Type) [Ring R]
    [IsSemisimpleRing (R ⧸ Ring.jacobson R)] (m n : ℕ)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : ∀ z : ℤ, φ.hom.toLinearMap z = z) :
    (2 * m ≤ n → Function.Surjective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) ∧
    (2 * m + 1 ≤ n → Function.Bijective
      (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) := by
  sorry

end TauCetiRoadmap.SchemeKTheoryOperations
