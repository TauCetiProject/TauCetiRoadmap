module

import Mathlib

/-!
# Finite group actions on compact Riemann surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs: the generating-vector/surface-kernel correspondence,
the torsion theorem and exact-order criterion for surface kernels, integrality of the
realized genus, the Hurwitz bound and equality case, Harvey's cyclic criterion, and the
Wiman bound and equality case. Definitions have real bodies on native group carriers.

The following geometric headlines are not statable at the pins with a few simple definitions:
* Riemann existence and its marked analytic inverse (§§2.3–2.6): the topological genus,
  branched quotient signature and marked complex-orbifold realization are missing.
* Topological classification (§§3.4–3.6): the colour-preserving marked mapping-class action
  on surface-kernel epimorphisms modulo conjugation is missing.
* Generic fullness and the extension theorem (§§5.2–5.5): the orbifold Teichmüller carrier,
  its pullback maps and their fixed loci are missing.
* Macbeath's equality (§6.1): the realization relating the vector to its holomorphic action
  is missing; a sum of group-theoretic counts would not state that equality.
* Eichler and Chevalley–Weil (§§7.1–7.2): the finite-dimensional space of global holomorphic
  differentials on a compact surface and its geometric pullback representation are missing.
  The regular-representation sum is only a dimension check, not the character theorem.
* Kani–Rosen and the Jacobian decomposition (§§7.3–7.6): the curve's Jacobian, its
  functorial action, the analytic comparison and images of rational idempotents are missing.

Products and commutators use Mathlib's multiplication. Peripheral generators come from
positive loops in the opposite of Mathlib's fundamental group, as specified in README
Conventions 8; thus their endpoint labels multiply in the order of the presentation.
-/

open scoped commutatorElement Manifold ContDiff

namespace TauCetiRoadmap.GroupActionsOnRiemannSurfaces

/-! ## Layer 0: signatures and generating vectors -/

/-- `README.md`, Layer 0, 0.1. A signature `(h; m₁, …, m_r)`: quotient genus `h` and periods
`m j ≥ 2`, sorted nondecreasing. -/
structure Signature where
  h : ℕ
  r : ℕ
  m : Fin r → ℕ
  two_le : ∀ j, 2 ≤ m j
  mono : Monotone m

namespace Signature

/-- `README.md`, Layer 0, 0.1. The Riemann–Hurwitz quantity `μ(σ) = 2h − 2 + Σ (1 − 1/m_j)`. -/
def mu (σ : Signature) : ℚ := 2 * (σ.h : ℚ) - 2 + ∑ j, (1 - 1 / (σ.m j : ℚ))

/-- `README.md`, Layer 0, 0.1. Hyperbolic signatures are those with `μ(σ) > 0`. -/
def IsHyperbolic (σ : Signature) : Prop := 0 < σ.mu

/-- `README.md`, Layer 0, 0.1. The genus of an action of a group of order `n` with signature `σ`,
as a rational number: `1 + n μ(σ)/2`. -/
def genusOfOrder (σ : Signature) (n : ℕ) : ℚ := 1 + n * σ.mu / 2

/-- `README.md`, Layer 0, 0.1 and Layer 8. The periods as a list, for statements that compare
signatures of different lengths. -/
def periods (σ : Signature) : List ℕ := List.ofFn σ.m

end Signature

variable {G : Type*} [Group G]

/-- `README.md`, Layer 0, 0.2. A generating vector of `G` with signature `σ`. The relation is
`⁅a₁, b₁⁆ ⋯ ⁅a_h, b_h⁆ c₁ ⋯ c_r = 1` in Mathlib's multiplication (pinned convention 3). -/
@[ext]
structure GenVector (G : Type*) [Group G] (σ : Signature) where
  a : Fin σ.h → G
  b : Fin σ.h → G
  c : Fin σ.r → G
  rel : (List.ofFn fun i => ⁅a i, b i⁆).prod * (List.ofFn c).prod = 1
  orderOf_c : ∀ j, orderOf (c j) = σ.m j
  closure_eq_top : Subgroup.closure (Set.range a ∪ Set.range b ∪ Set.range c) = ⊤

/-- `README.md`, Layer 0, 0.4. The relators of `Γ(σ)` on generators `A i, B i, C j`
(`Sum.inl i`, `Sum.inr (Sum.inl i)`, `Sum.inr (Sum.inr j)`): `C j ^ m j` and the product word of
convention 3. -/
def signatureRelators (σ : Signature) : Set (FreeGroup (Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r)) :=
  (Set.range fun j : Fin σ.r =>
      FreeGroup.of (Sum.inr (Sum.inr j) : Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r) ^ σ.m j) ∪
    {(List.ofFn fun i : Fin σ.h =>
        ⁅FreeGroup.of (Sum.inl i : Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r),
          FreeGroup.of (Sum.inr (Sum.inl i) : Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r)⁆).prod *
      (List.ofFn fun j : Fin σ.r =>
        FreeGroup.of (Sum.inr (Sum.inr j) : Fin σ.h ⊕ Fin σ.h ⊕ Fin σ.r)).prod}

/-- `README.md`, Layer 0, 0.4. The signature group `Γ(σ)`. -/
abbrev SignatureGroup (σ : Signature) : Type := PresentedGroup (signatureRelators σ)

namespace SignatureGroup

variable {σ : Signature}

/-- `README.md`, Layer 0, 0.4. The distinguished generators. -/
def A (i : Fin σ.h) : SignatureGroup σ := PresentedGroup.of (Sum.inl i)

/-- The second handle generator of the signature group. -/
def B (i : Fin σ.h) : SignatureGroup σ := PresentedGroup.of (Sum.inr (Sum.inl i))

/-- The positively oriented peripheral generator of the signature group. -/
def C (j : Fin σ.r) : SignatureGroup σ := PresentedGroup.of (Sum.inr (Sum.inr j))

end SignatureGroup

/-- `README.md`, Layer 0, 0.5. Surface-kernel epimorphisms: surjective, with exact orders on
the `C j`. -/
def SurfaceKernelHom (G : Type*) [Group G] (σ : Signature) : Type _ :=
  { φ : SignatureGroup σ →* G // Function.Surjective φ ∧ ∀ j, orderOf (φ (SignatureGroup.C j)) = σ.m j }

/-- Generating vectors correspond bijectively to surjective homomorphisms with exact
peripheral orders, by evaluation on the distinguished generators (README §0.5). -/
theorem GenVector.surfaceKernelHom_correspondence (G : Type*) [Group G] (σ : Signature) :
    ∃ e : GenVector G σ ≃ SurfaceKernelHom G σ,
      (∀ v i, (e v).val (SignatureGroup.A i) = v.a i) ∧
      (∀ v i, (e v).val (SignatureGroup.B i) = v.b i) ∧
      (∀ v j, (e v).val (SignatureGroup.C j) = v.c j) := by
  sorry

/-! ## Layer 2: surface kernels and the existence criterion -/

/-- `README.md`, Layer 2, 2.1. The torsion of `Γ(σ)` is conjugate into the `⟨C j⟩`. -/
theorem SignatureGroup.isConj_pow_C_of_isOfFinOrder {σ : Signature} (hσ : σ.IsHyperbolic) (x : SignatureGroup σ)
    (hx : IsOfFinOrder x) (hx1 : x ≠ 1) : ∃ j k, IsConj x (SignatureGroup.C j ^ k) := by
  sorry

/-- `README.md`, Layer 2, 2.2. Exact orders are equivalent to a torsion-free kernel. -/
theorem SurfaceKernelHom.ker_torsionFree {σ : Signature} (hσ : σ.IsHyperbolic)
    (φ : SignatureGroup σ →* G) (hφ : Function.Surjective φ) :
    (∀ j, orderOf (φ (SignatureGroup.C j)) = σ.m j) ↔
      ∀ x ∈ φ.ker, x ≠ 1 → ¬IsOfFinOrder x := by
  sorry

/-- `README.md`, Layer 2, 2.5. The rational genus of a generating vector is a natural number
`≥ 2` when the signature is hyperbolic. -/
theorem GenVector.exists_genus_eq [Finite G] {σ : Signature} (v : GenVector G σ)
    (hσ : σ.IsHyperbolic) : ∃ g : ℕ, 2 ≤ g ∧ (g : ℚ) = σ.genusOfOrder (Nat.card G) := by
  sorry

/-! ## Layer 4: the Hurwitz and Wiman bounds, Harvey's criterion -/

/-- `README.md`, Layer 4, 4.3. The Hurwitz bound `|G| ≤ 84 (g − 1)` from the criterion. -/
theorem GenVector.card_le_hurwitz [Finite G] {σ : Signature} (v : GenVector G σ)
    (hσ : σ.IsHyperbolic) :
    (Nat.card G : ℚ) ≤ 84 * (σ.genusOfOrder (Nat.card G) - 1) := by
  sorry

/-- `README.md`, Layer 4, 4.3. Equality in the Hurwitz bound is the signature `(0; 2, 3, 7)`. -/
theorem GenVector.card_eq_hurwitz_iff [Finite G] {σ : Signature} (v : GenVector G σ)
    (hσ : σ.IsHyperbolic) :
    (Nat.card G : ℚ) = 84 * (σ.genusOfOrder (Nat.card G) - 1) ↔ σ.h = 0 ∧ σ.periods = [2, 3, 7] := by
  sorry

/-- `README.md`, Layer 4, 4.4. Harvey's criterion for a cyclic group of order `n`. -/
theorem harvey_iff (n : ℕ) (hn : 0 < n) (σ : Signature) (hσ : σ.IsHyperbolic) :
    Nonempty (GenVector (Multiplicative (ZMod n)) σ) ↔
      (Finset.univ.lcm σ.m ∣ n) ∧ (σ.h = 0 → Finset.univ.lcm σ.m = n) ∧
        (∀ j, (Finset.univ.erase j).lcm σ.m = Finset.univ.lcm σ.m) ∧ σ.r ≠ 1 ∧
        (σ.h = 0 → 3 ≤ σ.r) ∧
        (2 ∣ Finset.univ.lcm σ.m →
          Even (Finset.univ.filter fun j =>
            2 ^ (Finset.univ.lcm σ.m).factorization 2 ∣ σ.m j).card) := by
  sorry

/-- `README.md`, Layer 4, 4.5. The Wiman bound: a cyclic group acting in genus `g` has order
`≤ 4g + 2`. -/
theorem wiman (n : ℕ) (hn : 0 < n) {σ : Signature} (v : GenVector (Multiplicative (ZMod n)) σ)
    (hσ : σ.IsHyperbolic) : (n : ℚ) ≤ 4 * σ.genusOfOrder n + 2 := by
  sorry

/-- `README.md`, Layer 4, 4.5. The Wiman bound is attained, by `(0; 2, 2g + 1, 4g + 2)`. -/
theorem wiman_eq_iff (n : ℕ) (hn : 0 < n) {σ : Signature} (v : GenVector (Multiplicative (ZMod n)) σ)
    (hσ : σ.IsHyperbolic) :
    (n : ℚ) = 4 * σ.genusOfOrder n + 2 ↔
      σ.h = 0 ∧ ∃ g : ℕ, σ.periods = [2, 2 * g + 1, 4 * g + 2] := by
  sorry

end TauCetiRoadmap.GroupActionsOnRiemannSurfaces
