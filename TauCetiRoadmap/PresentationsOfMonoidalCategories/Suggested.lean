import Mathlib

/-!
# Presentations of monoidal categories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

The data of Layer 0 (`FusionRules`, `FSymbols`, `RSymbols`) are given real bodies, with the
equations pinned in the `Conventions` section of `README.md` written out index by index. The
headlines that need only these are stated below. The hypothesis of Layer 2 is PivotalSpherical's
`IsSplitSimpleFamily`, whose three conditions appear as explicit hypotheses below.

Not stated here, because they are about the constructed category `FSymbols.Model P` with its
monoidal structure, which is a construction rather than a signature: the Layer 1 main theorem
(`MonoidalCategory (Model P)`), reconstruction and the round trip (Layer 2), the classification and
autoequivalence theorems (Layer 3), and the braiding, rigidity, pivotal and spherical statements
on `Model P` (Layers 4 to 6). Extraction of F- and R-symbols (2.2, 4.2) is stated.
-/

namespace TauCetiRoadmap.PresentationsOfMonoidalCategories

open CategoryTheory Limits MonoidalCategory

universe u v w

/-! ## Layer 0: the data -/

/-- **Fusion rules** on a finite index type: a unit index and multiplicities
`N a b c = N_{ab}^c`, with the unit laws `N_{ua}^b = N_{au}^b = if a = b then 1 else 0`. -/
structure FusionRules (ι : Type u) [Fintype ι] [DecidableEq ι] where
  /-- The index of the tensor unit. -/
  unit : ι
  /-- The multiplicity `N_{ab}^c` of `S_c` in `S_a ⊗ S_b`. -/
  N : ι → ι → ι → ℕ
  /-- Left unit law. -/
  N_unit_left : ∀ a b, N unit a b = if a = b then 1 else 0
  /-- Right unit law. -/
  N_unit_right : ∀ a b, N a unit b = if a = b then 1 else 0

namespace FusionRules

variable {ι : Type u} [Fintype ι] [DecidableEq ι] (N : FusionRules ι)

/-- Row indices of `F^{abc}_d`: `Σ e, Fin N_{ab}^e × Fin N_{ec}^d`, indexing the left basis
`(φ^{ab→e}_i ▷ c) ≫ φ^{ec→d}_j` of `Hom((a ⊗ b) ⊗ c, d)`. -/
abbrev Left (a b c d : ι) : Type u := Σ e : ι, Fin (N.N a b e) × Fin (N.N e c d)

/-- Column indices of `F^{abc}_d`: `Σ f, Fin N_{bc}^f × Fin N_{af}^d`, indexing the right basis
`(a ◁ φ^{bc→f}_k) ≫ φ^{af→d}_l` of `Hom(a ⊗ (b ⊗ c), d)`. -/
abbrev Right (a b c d : ι) : Type u := Σ f : ι, Fin (N.N b c f) × Fin (N.N a f d)

/-- The unique basis vector of `Hom(a ⊗ u, a)`. -/
def unitRight (a : ι) : Fin (N.N a N.unit a) := ⟨0, by simp [N.N_unit_right]⟩

/-- The unique basis vector of `Hom(u ⊗ a, a)`. -/
def unitLeft (a : ι) : Fin (N.N N.unit a a) := ⟨0, by simp [N.N_unit_left]⟩

end FusionRules

/-- **F-symbols** over a commutative ring `R` for fusion rules `N`: the matrices `F^{abc}_d` with
two-sided inverses `F̄^{abc}_d`, satisfying the pentagon and the triangle exactly as pinned in
`README.md`. The inverse is data because rows and columns are indexed by different types; it is
unique, so `ext` compares `F` alone. -/
structure FSymbols (R : Type v) [CommRing R] {ι : Type u} [Fintype ι] [DecidableEq ι]
    (N : FusionRules ι) where
  /-- `F^{abc}_d`, rows `Left`, columns `Right`. -/
  F : ∀ a b c d : ι, Matrix (N.Left a b c d) (N.Right a b c d) R
  /-- `F̄^{abc}_d`, rows `Right`, columns `Left`. -/
  Finv : ∀ a b c d : ι, Matrix (N.Right a b c d) (N.Left a b c d) R
  F_mul_Finv : ∀ a b c d, F a b c d * Finv a b c d = 1
  Finv_mul_F : ∀ a b c d, Finv a b c d * F a b c d = 1
  /-- The pentagon: left side `α_{AB,C,D} ≫ α_{A,B,CD}`, right side
  `(α_{A,B,C} ▷ D) ≫ α_{A,BC,D} ≫ (A ◁ α_{B,C,D})`. -/
  pentagon : ∀ (A B C D E p q r s : ι) (i₁ : Fin (N.N A B p)) (i₂ : Fin (N.N p C q))
    (i₃ : Fin (N.N q D E)) (k : Fin (N.N C D r)) (m : Fin (N.N B r s)) (n : Fin (N.N A s E)),
    ∑ l : Fin (N.N p r E), F p C D E ⟨q, i₂, i₃⟩ ⟨r, k, l⟩ * F A B r E ⟨p, i₁, l⟩ ⟨s, m, n⟩ =
      ∑ t : ι, ∑ x : Fin (N.N B C t), ∑ y : Fin (N.N A t q), ∑ z : Fin (N.N t D s),
        F A B C q ⟨p, i₁, i₂⟩ ⟨t, x, y⟩ * F A t D E ⟨q, y, i₃⟩ ⟨s, z, n⟩ *
          F B C D s ⟨t, x, z⟩ ⟨r, k, m⟩
  /-- The triangle: `F^{auc}_d[(a,0,j),(c,0,l)] = if j = l then 1 else 0`. -/
  triangle : ∀ (a c d : ι) (j l : Fin (N.N a c d)),
    F a N.unit c d ⟨a, N.unitRight a, j⟩ ⟨c, N.unitLeft c, l⟩ = if j = l then 1 else 0

/-- **R-symbols** for F-symbols `P`: matrices `R^{ab}_c : Fin N_{ab}^c × Fin N_{ba}^c` with
inverses, satisfying the two hexagons as pinned in `README.md`. -/
structure RSymbols {K : Type v} [CommRing K] {ι : Type u} [Fintype ι] [DecidableEq ι]
    {N : FusionRules ι} (P : FSymbols K N) where
  /-- `R^{ab}_c`, in the same direction as `F`. -/
  R : ∀ a b c : ι, Matrix (Fin (N.N a b c)) (Fin (N.N b a c)) K
  /-- The inverse of `R^{ab}_c`. -/
  Rinv : ∀ a b c : ι, Matrix (Fin (N.N b a c)) (Fin (N.N a b c)) K
  R_mul_Rinv : ∀ a b c, R a b c * Rinv a b c = 1
  Rinv_mul_R : ∀ a b c, Rinv a b c * R a b c = 1
  /-- `hexagon_forward`, for `(e,i,j) : Left a b c d`, `n : N_{ca}^g`, `o : N_{bg}^d`. -/
  hexagon_forward : ∀ (a b c d e g : ι) (i : Fin (N.N a b e)) (j : Fin (N.N e c d))
    (n : Fin (N.N c a g)) (o : Fin (N.N b g d)),
    ∑ f : ι, ∑ k : Fin (N.N b c f), ∑ l : Fin (N.N a f d), ∑ m : Fin (N.N f a d),
        P.F a b c d ⟨e, i, j⟩ ⟨f, k, l⟩ * R a f d l m * P.F b c a d ⟨f, k, m⟩ ⟨g, n, o⟩ =
      ∑ p : Fin (N.N b a e), ∑ q : Fin (N.N a c g),
        R a b e i p * P.F b a c d ⟨e, p, j⟩ ⟨g, q, o⟩ * R a c g q n
  /-- `hexagon_reverse`, for `(f,k,l) : Right a b c d`, `n : N_{ca}^g`, `o : N_{gb}^d`. -/
  hexagon_reverse : ∀ (a b c d f g : ι) (k : Fin (N.N b c f)) (l : Fin (N.N a f d))
    (n : Fin (N.N c a g)) (o : Fin (N.N g b d)),
    ∑ e : ι, ∑ i : Fin (N.N a b e), ∑ j : Fin (N.N e c d), ∑ m : Fin (N.N c e d),
        P.Finv a b c d ⟨f, k, l⟩ ⟨e, i, j⟩ * R e c d j m * P.Finv c a b d ⟨e, i, m⟩ ⟨g, n, o⟩ =
      ∑ p : Fin (N.N c b f), ∑ q : Fin (N.N a c g),
        R b c f k p * P.Finv a c b d ⟨f, p, l⟩ ⟨g, q, o⟩ * R a c g q n

/-! ## Layer 2: extraction and reconstruction -/

section Extraction

variable {R : Type v} [CommRing R] [Nontrivial R] {C : Type u} [Category.{w} C] [Preadditive C]
  [Linear R C] [HasFiniteBiproducts C] [MonoidalCategory C] [MonoidalPreadditive C]
  [MonoidalLinear R C] {ι : Type*} [Fintype ι] [DecidableEq ι] {S : ι → C}

/-- **Extraction.** For a split simple family `S` (PivotalSpherical's `IsSplitSimpleFamily R S`,
whose three conditions are spelled out here) and a fusion basis `φ` normalized through
`e : 𝟙_ C ≅ S N.unit`, there is exactly one `FSymbols R N` whose `F` expresses the left family in
the right family across the associator. -/
theorem existsUnique_fSymbols
    (_hS : ∀ a, Function.Bijective (algebraMap R (End (S a)))) (_horth : HomOrthogonal S)
    (_hdec : ∀ X : C, ∃ (κ : Type) (_ : Fintype κ) (f : κ → ι), Nonempty (X ≅ ⨁ (S ∘ f)))
    (N : FusionRules ι) (e : 𝟙_ C ≅ S N.unit)
    (φ : ∀ a b c, Module.Basis (Fin (N.N a b c)) R (S a ⊗ S b ⟶ S c))
    (_hl : ∀ a, φ N.unit a a (N.unitLeft a) = (e.inv ▷ S a) ≫ (λ_ (S a)).hom)
    (_hr : ∀ a, φ a N.unit a (N.unitRight a) = (S a ◁ e.inv) ≫ (ρ_ (S a)).hom) :
    ∃! P : FSymbols R N, ∀ (a b c d : ι) (x : N.Left a b c d),
      (φ a b x.1 x.2.1 ▷ S c) ≫ φ x.1 c d x.2.2 =
        ∑ y : N.Right a b c d, P.F a b c d x y •
          ((α_ (S a) (S b) (S c)).hom ≫ (S a ◁ φ b c y.1 y.2.1) ≫ φ a y.1 d y.2.2) := sorry

/-! ## Layer 4: braidings -/

/-- **Extraction of R-symbols.** For a split simple family and a normalized fusion basis, a
braiding on `C` gives exactly one `RSymbols P` for the F-symbols `P` extracted from the same basis:
`R` expresses each fusion basis in the braided one. -/
theorem existsUnique_rSymbols [BraidedCategory C]
    (_hS : ∀ a, Function.Bijective (algebraMap R (End (S a)))) (_horth : HomOrthogonal S)
    (_hdec : ∀ X : C, ∃ (κ : Type) (_ : Fintype κ) (f : κ → ι), Nonempty (X ≅ ⨁ (S ∘ f)))
    (N : FusionRules ι) (e : 𝟙_ C ≅ S N.unit)
    (φ : ∀ a b c, Module.Basis (Fin (N.N a b c)) R (S a ⊗ S b ⟶ S c))
    (_hl : ∀ a, φ N.unit a a (N.unitLeft a) = (e.inv ▷ S a) ≫ (λ_ (S a)).hom)
    (_hr : ∀ a, φ a N.unit a (N.unitRight a) = (S a ◁ e.inv) ≫ (ρ_ (S a)).hom) (P : FSymbols R N)
    (_hP : ∀ (a b c d : ι) (x : N.Left a b c d),
      (φ a b x.1 x.2.1 ▷ S c) ≫ φ x.1 c d x.2.2 =
        ∑ y : N.Right a b c d, P.F a b c d x y •
          ((α_ (S a) (S b) (S c)).hom ≫ (S a ◁ φ b c y.1 y.2.1) ≫ φ a y.1 d y.2.2)) :
    ∃! Q : RSymbols P, ∀ (a b c : ι) (i : Fin (N.N a b c)),
      φ a b c i = ∑ j : Fin (N.N b a c), Q.R a b c i j • ((β_ (S a) (S b)).hom ≫ φ b a c j) :=
  sorry

end Extraction

end TauCetiRoadmap.PresentationsOfMonoidalCategories
