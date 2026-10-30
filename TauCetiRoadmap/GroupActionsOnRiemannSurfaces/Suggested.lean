import Mathlib
import TauCeti.GroupTheory.TriangleGroup.Basic
import TauCeti.GroupTheory.TriangleGroup.Signatures
import TauCeti.Combinatorics.PermutationTriple.Basic
import TauCeti.FieldTheory.FunctionField.Automorphism.HurwitzBound

/-!
# Finite group actions on compact Riemann surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
two signature-level carriers, their natural actions, the signature group, the automorphism group
of a Riemann surface, and the headline theorems whose statements use nothing else. The other
targets — the universal property of `Γ(σ)` (0.4), the equivalence with surface-kernel
epimorphisms (0.5), the comparison with Tau Ceti's `TriangleGroup` (0.7), the signature of an
action (1.3) with Riemann–Hurwitz (1.4) and the existence criterion (2.5), which need the Fuchsian
orbifolds roadmap's topological genus, and the Jacobian decomposition record (7.6) — are
specified, with their definitions and Checks, in `README.md` only. Theorem proofs are `sorry`;
the non-vacuity constructor `hyperellipticGenusTwoVector` and the bridge check
`hurwitzBound_functionField` apply Mathlib and Tau Ceti declarations as real proof terms.

The combinatorial carrier is `GenVector G σ`: elements `a b : Fin h → G`, `c : Fin r → G` with the
relation `⁅a₁, b₁⁆ ⋯ ⁅a_h, b_h⁆ c₁ ⋯ c_r = 1` **in Mathlib's multiplication and in that order**,
exact orders `orderOf (c j) = m j`, and `Subgroup.closure = ⊤`. The signature `σ` carries the
quotient genus `h` and the periods `m : Fin r → ℕ`, each `≥ 2`, sorted nondecreasing as the LMFDB
stores them. Riemann–Hurwitz is stated through the rational `Signature.mu`; integrality of the
genus is a theorem (`GenVector.exists_genus_eq`), not a definition. The comparison with
`PermutationTriple` is `(σ0, σ1, σinf) = (c₃, c₂, c₁)`.

The geometric side is Tau Ceti's compact-Riemann-surface hypothesis stack: `Aut X` and the
embedding `toAut` of a faithful holomorphic action (`MDifferentiable 𝓘(ℂ) 𝓘(ℂ)` maps).
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

/-- `README.md`, Layer 4, 4.2. The dimension `3h − 3 + r` of the family. -/
def dim (σ : Signature) : ℤ := 3 * (σ.h : ℤ) - 3 + σ.r

/-- `README.md`, Layer 0, 0.1. The triangle signature `(0; m₁, m₂, m₃)`. -/
def triangle (m₁ m₂ m₃ : ℕ) (h₁ : 2 ≤ m₁) (h₁₂ : m₁ ≤ m₂) (h₂₃ : m₂ ≤ m₃) : Signature where
  h := 0
  r := 3
  m := ![m₁, m₂, m₃]
  two_le j := by fin_cases j <;> simp <;> omega
  mono := Fin.monotone_iff_le_succ.2 fun i => by fin_cases i <;> simp [h₁₂, h₂₃]

/-- `README.md`, Layer 0, 0.1. For a triangle signature, `μ` is minus Tau Ceti's orbifold Euler
characteristic. -/
theorem mu_triangle (m₁ m₂ m₃ : ℕ) (h₁ : 2 ≤ m₁) (h₁₂ : m₁ ≤ m₂) (h₂₃ : m₂ ≤ m₃) :
    (triangle m₁ m₂ m₃ h₁ h₁₂ h₂₃).mu = -TauCeti.orbifoldEulerChar m₁ m₂ m₃ := by
  sorry

/-- `README.md`, Layer 0, 0.1. `μ(σ) ≥ 1/42` for every hyperbolic signature. -/
theorem one_div_fortyTwo_le_mu (σ : Signature) (hσ : σ.IsHyperbolic) : 1 / 42 ≤ σ.mu := by
  sorry

/-- `README.md`, Layer 0, 0.1. Equality in `μ(σ) ≥ 1/42` holds only for `(0; 2, 3, 7)`. -/
theorem mu_eq_one_div_fortyTwo_iff (σ : Signature) (hσ : σ.IsHyperbolic) :
    σ.mu = 1 / 42 ↔ σ.h = 0 ∧ σ.periods = [2, 3, 7] := by
  sorry

/-- `README.md`, Layer 4, 4.2. The dimension is nonnegative for hyperbolic signatures and
vanishes exactly for triangle signatures. -/
theorem dim_nonneg (σ : Signature) (hσ : σ.IsHyperbolic) : 0 ≤ σ.dim := by
  sorry

theorem dim_eq_zero_iff (σ : Signature) (hσ : σ.IsHyperbolic) : σ.dim = 0 ↔ σ.h = 0 ∧ σ.r = 3 := by
  sorry

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

/-- `README.md`, Layer 0, 0.1. The signature `(0; 2, 2, 2, 2, 2, 2)` of the hyperelliptic
involution in genus two. -/
def hyperellipticGenusTwoSignature : Signature where
  h := 0
  r := 6
  m := fun _ => 2
  two_le := fun _ => le_rfl
  mono := monotone_const

/-- `README.md`, Layer 0, 0.2: a non-vacuity constructor. The generating vector of
`ZMod 2` with signature `(0; 2⁶)`, with every field proved. -/
def hyperellipticGenusTwoVector : GenVector (Multiplicative (ZMod 2)) hyperellipticGenusTwoSignature where
  a := Fin.elim0
  b := Fin.elim0
  c := fun _ => Multiplicative.ofAdd 1
  rel := by decide
  orderOf_c := fun _ => show orderOf (Multiplicative.ofAdd (1 : ZMod 2)) = 2 from
    orderOf_eq_prime (by decide) (by decide)
  closure_eq_top := by
    rw [eq_top_iff]
    rintro x -
    have h1 : Multiplicative.ofAdd (1 : ZMod 2) ∈ Subgroup.closure
        (Set.range (Fin.elim0 : Fin 0 → Multiplicative (ZMod 2)) ∪
          Set.range (Fin.elim0 : Fin 0 → Multiplicative (ZMod 2)) ∪
          Set.range fun _ : Fin 6 => Multiplicative.ofAdd (1 : ZMod 2)) :=
      Subgroup.subset_closure (Set.mem_union_right _ ⟨0, rfl⟩)
    obtain rfl | rfl : x = 1 ∨ x = Multiplicative.ofAdd 1 := by revert x; decide
    · exact one_mem _
    · exact h1

namespace GenVector

variable {σ : Signature}

/-- `README.md`, Layer 0, 0.2. Finitely many generating vectors for a finite group. -/
instance [Finite G] : Finite (GenVector G σ) :=
  Finite.of_injective (fun v : GenVector G σ => (v.a, v.b, v.c)) fun v w h => by
    simp only [Prod.mk.injEq] at h
    exact GenVector.ext h.1 h.2.1 h.2.2

/-- `README.md`, Layer 0, 0.3. Transport along a group isomorphism. -/
def map {H : Type*} [Group H] (e : G ≃* H) (v : GenVector G σ) : GenVector H σ where
  a := e ∘ v.a
  b := e ∘ v.b
  c := e ∘ v.c
  rel := by
    have h := congrArg e v.rel
    rw [map_mul, map_list_prod, map_list_prod, List.map_ofFn, List.map_ofFn, map_one] at h
    simpa [Function.comp_def, map_commutatorElement] using h
  orderOf_c j := by
    rw [Function.comp_apply, MulEquiv.orderOf_eq, v.orderOf_c]
  closure_eq_top := by
    have h := MonoidHom.map_closure e.toMonoidHom (Set.range v.a ∪ Set.range v.b ∪ Set.range v.c)
    rw [v.closure_eq_top, Subgroup.map_top_of_surjective _ e.surjective, MulEquiv.coe_toMonoidHom,
      Set.image_union, Set.image_union, ← Set.range_comp, ← Set.range_comp, ← Set.range_comp] at h
    exact h.symm

/-- `README.md`, Layer 0, 0.3. The `Aut(G)`-action. -/
instance : MulAction (MulAut G) (GenVector G σ) where
  smul α v := v.map α
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

/-- `README.md`, Layer 0, 0.3. Simultaneous conjugation: the `Inn(G)`-action, as a `G`-action
through `MulAut.conj`. -/
instance innAction : MulAction G (GenVector G σ) :=
  MulAction.compHom (GenVector G σ) (MulAut.conj : G →* MulAut G)

/-- `README.md`, Layer 3, 3.7. The number of generating vectors up to simultaneous conjugation,
the LMFDB's `hgcwa_unique_groups.gen_vectors`. -/
noncomputable def numInnClasses (G : Type*) [Group G] (σ : Signature) : ℕ :=
  Nat.card (MulAction.orbitRel.Quotient G (GenVector G σ))

/-- `README.md`, Layer 3, 3.1. The refined passport: the vector of conjugacy classes of the
`c j`. -/
def refinedPassport (v : GenVector G σ) : Fin σ.r → ConjClasses G :=
  fun j => ConjClasses.mk (v.c j)

/-- `README.md`, Layer 3, 3.1. Simultaneous conjugation preserves the refined passport. -/
theorem refinedPassport_smul (g : G) (v : GenVector G σ) :
    refinedPassport (g • v) = refinedPassport v := by
  sorry

end GenVector

/-! ## The signature group and surface-kernel epimorphisms -/

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

def B (i : Fin σ.h) : SignatureGroup σ := PresentedGroup.of (Sum.inr (Sum.inl i))

def C (j : Fin σ.r) : SignatureGroup σ := PresentedGroup.of (Sum.inr (Sum.inr j))

/-- `README.md`, Layer 2, 2.1. The torsion of `Γ(σ)` is conjugate into the `⟨C j⟩`. -/
theorem isConj_pow_C_of_isOfFinOrder (hσ : σ.IsHyperbolic) (x : SignatureGroup σ)
    (hx : IsOfFinOrder x) (hx1 : x ≠ 1) : ∃ j k, IsConj x (C j ^ k) := by
  sorry

end SignatureGroup

/-- `README.md`, Layer 0, 0.5. Surface-kernel epimorphisms: surjective, with exact orders on
the `C j`. -/
def SurfaceKernelHom (G : Type*) [Group G] (σ : Signature) : Type _ :=
  { φ : SignatureGroup σ →* G // Function.Surjective φ ∧ ∀ j, orderOf (φ (SignatureGroup.C j)) = σ.m j }

/-- `README.md`, Layer 2, 2.2. Exact orders are equivalent to a torsion-free kernel. -/
theorem SurfaceKernelHom.ker_torsionFree {σ : Signature} (hσ : σ.IsHyperbolic)
    (φ : SignatureGroup σ →* G) (hφ : Function.Surjective φ) :
    (∀ j, orderOf (φ (SignatureGroup.C j)) = σ.m j) ↔
      ∀ x ∈ φ.ker, x ≠ 1 → ¬IsOfFinOrder x := by
  sorry

/-- `README.md`, Layer 0, 0.7. A generating vector of a permutation group with a triangle
signature is a connected permutation triple, `(σ0, σ1, σinf) = (c₃, c₂, c₁)`. -/
def GenVector.toPermutationTriple {n : ℕ} {P : Subgroup (Equiv.Perm (Fin n))} {m₁ m₂ m₃ : ℕ}
    {h₁ : 2 ≤ m₁} {h₁₂ : m₁ ≤ m₂} {h₂₃ : m₂ ≤ m₃}
    (v : GenVector P (Signature.triangle m₁ m₂ m₃ h₁ h₁₂ h₂₃)) : TauCeti.PermutationTriple n where
  σ0 := (v.c ⟨2, show (2 : ℕ) < 3 by norm_num⟩ : Equiv.Perm (Fin n))
  σ1 := (v.c ⟨1, show (1 : ℕ) < 3 by norm_num⟩ : Equiv.Perm (Fin n))
  σinf := (v.c ⟨0, show (0 : ℕ) < 3 by norm_num⟩ : Equiv.Perm (Fin n))
  product_eq_one := by
    have h := congrArg Subtype.val v.rel
    simpa [Signature.triangle, List.ofFn_succ, Function.comp_def, mul_assoc] using h

/-! ## Layer 1: actions on compact Riemann surfaces -/

section Analytic

variable {X : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ) ∞ X]
  [IsManifold 𝓘(ℂ) 1 X] [T2Space X] [CompactSpace X] [ConnectedSpace X]

/-- `README.md`, Layer 1, 1.1. The automorphism group of a Riemann surface: holomorphic
bijections with holomorphic inverse. -/
def Aut (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] : Subgroup (Equiv.Perm X) where
  carrier := {f | MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f ∧ MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f.symm}
  mul_mem' hf hg := ⟨hf.1.comp hg.1, hg.2.comp hf.2⟩
  one_mem' := ⟨mdifferentiable_id, mdifferentiable_id⟩
  inv_mem' hf := ⟨hf.2, hf.1⟩

variable (G : Type*) [Group G] [Finite G] [MulAction G X] [FaithfulSMul G X]

/-- `README.md`, Layer 1, 1.1. A faithful holomorphic action embeds `G` into `Aut X`. -/
def toAut (hol : ∀ γ : G, MDifferentiable 𝓘(ℂ) 𝓘(ℂ) fun x : X => γ • x) : G →* Aut X :=
  (MulAction.toPermHom G X).codRestrict (Aut X) fun γ => ⟨hol γ, hol γ⁻¹⟩

/-- `README.md`, Layer 5, 5.1. The action is the full automorphism group. -/
def IsFull (hol : ∀ γ : G, MDifferentiable 𝓘(ℂ) 𝓘(ℂ) fun x : X => γ • x) : Prop :=
  Function.Surjective (toAut G hol)

/-- `README.md`, Layer 6, 6.1. The number of fixed points of `γ`, as the realized action
computes it (`MulAction.fixedBy X γ` is finite for `γ ≠ 1`). -/
noncomputable def numFixedPointsOfAction (γ : G) : ℕ := Nat.card (MulAction.fixedBy X γ)

end Analytic

/-! ## Layer 2: the existence criterion -/

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

/-- `README.md`, Layer 4, 4.3: the bridge check. Tau Ceti's function-field Hurwitz bound, applied
to a function field over `ℂ`; the roadmap identifies this with `card_le_hurwitz` through the
meromorphic function field of `X`. Every binder here is the one Tau Ceti's theorem takes. -/
theorem hurwitzBound_functionField {F : Type*} [Field F] [Algebra ℂ F]
    (hF : TauCeti.IsFunctionField ℂ F) (hex : IsIntegrallyClosedIn ℂ F)
    (G : Subgroup (F ≃ₐ[ℂ] F)) [Finite G] (hg : 2 ≤ TauCeti.genus ℂ F)
    (htame : ∀ P : TauCeti.Place ℂ F,
      TauCeti.Place.IsTame ℂ (IntermediateField.fixedField G) P) :
    Nat.card G ≤ 84 * (TauCeti.genus ℂ F - 1) :=
  TauCeti.natCard_le_eighty_four_mul_genus_sub_one hF hex G hg htame

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
theorem wiman (n : ℕ) {σ : Signature} (v : GenVector (Multiplicative (ZMod n)) σ)
    (hσ : σ.IsHyperbolic) : (n : ℚ) ≤ 4 * σ.genusOfOrder n + 2 := by
  sorry

/-- `README.md`, Layer 4, 4.5. The Wiman bound is attained, by `(0; 2, 2g + 1, 4g + 2)`. -/
theorem wiman_eq_iff (n : ℕ) {σ : Signature} (v : GenVector (Multiplicative (ZMod n)) σ)
    (hσ : σ.IsHyperbolic) :
    (n : ℚ) = 4 * σ.genusOfOrder n + 2 ↔
      σ.h = 0 ∧ ∃ g : ℕ, σ.periods = [2, 2 * g + 1, 4 * g + 2] := by
  sorry

/-! ## Layer 5: Singerman's list -/

/-- `README.md`, Layer 5, 5.3. The pairs `(σ, σ', d)` of Singerman's list: a Fuchsian group of
signature `σ` is always contained in one of signature `σ'` with index `d`. Periods are compared
up to permutation, so the sorted form of each row is not spelled out. -/
def IsSingermanPair (σ σ' : Signature) (d : ℕ) : Prop :=
  (σ.h = 2 ∧ σ.periods = [] ∧ σ'.h = 0 ∧ σ'.periods = [2, 2, 2, 2, 2, 2] ∧ d = 2) ∨
  (∃ t, 2 ≤ t ∧ σ.h = 1 ∧ σ.periods = [t, t] ∧ σ'.h = 0 ∧ σ'.periods = [2, 2, 2, 2, t] ∧ d = 2) ∨
  (∃ t, 2 ≤ t ∧ σ.h = 1 ∧ σ.periods = [t] ∧ σ'.h = 0 ∧ σ'.periods = [2, 2, 2, 2 * t] ∧ d = 2) ∨
  (∃ t, 3 ≤ t ∧ σ.h = 0 ∧ σ.periods = [t, t, t, t] ∧ σ'.h = 0 ∧
    List.Perm σ'.periods [2, 2, 2, t] ∧ d = 4) ∨
  (∃ t₁ t₂, 2 ≤ t₁ ∧ 2 ≤ t₂ ∧ σ.h = 0 ∧ List.Perm σ.periods [t₁, t₁, t₂, t₂] ∧ σ'.h = 0 ∧
    List.Perm σ'.periods [2, 2, t₁, t₂] ∧ d = 2) ∨
  (∃ t, 4 ≤ t ∧ σ.h = 0 ∧ σ.periods = [t, t, t] ∧ σ'.h = 0 ∧ List.Perm σ'.periods [3, 3, t] ∧
    d = 3) ∨
  (∃ t, 4 ≤ t ∧ σ.h = 0 ∧ σ.periods = [t, t, t] ∧ σ'.h = 0 ∧ List.Perm σ'.periods [2, 3, 2 * t] ∧
    d = 6) ∨
  (∃ t₁ t₂, 2 ≤ t₁ ∧ 2 ≤ t₂ ∧ σ.h = 0 ∧ List.Perm σ.periods [t₁, t₁, t₂] ∧ σ'.h = 0 ∧
    List.Perm σ'.periods [2, t₁, 2 * t₂] ∧ d = 2) ∨
  (σ.h = 0 ∧ σ.periods = [7, 7, 7] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 7] ∧ d = 24) ∨
  (σ.h = 0 ∧ σ.periods = [2, 7, 7] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 7] ∧ d = 9) ∨
  (σ.h = 0 ∧ σ.periods = [3, 3, 7] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 7] ∧ d = 8) ∨
  (σ.h = 0 ∧ σ.periods = [4, 8, 8] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 8] ∧ d = 12) ∨
  (σ.h = 0 ∧ σ.periods = [3, 8, 8] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 8] ∧ d = 10) ∨
  (σ.h = 0 ∧ σ.periods = [9, 9, 9] ∧ σ'.h = 0 ∧ σ'.periods = [2, 3, 9] ∧ d = 12) ∨
  (σ.h = 0 ∧ σ.periods = [4, 4, 5] ∧ σ'.h = 0 ∧ σ'.periods = [2, 4, 5] ∧ d = 6) ∨
  (∃ n, 2 ≤ n ∧ σ.h = 0 ∧ σ.periods = [n, 4 * n, 4 * n] ∧ σ'.h = 0 ∧
    σ'.periods = [2, 3, 4 * n] ∧ d = 6) ∨
  (∃ n, 3 ≤ n ∧ σ.h = 0 ∧ σ.periods = [n, 2 * n, 2 * n] ∧ σ'.h = 0 ∧
    σ'.periods = [2, 4, 2 * n] ∧ d = 4) ∨
  (∃ n, 3 ≤ n ∧ σ.h = 0 ∧ σ.periods = [3, n, 3 * n] ∧ σ'.h = 0 ∧
    σ'.periods = [2, 3, 3 * n] ∧ d = 4) ∨
  (∃ n, 4 ≤ n ∧ σ.h = 0 ∧ σ.periods = [2, n, 2 * n] ∧ σ'.h = 0 ∧
    σ'.periods = [2, 3, 2 * n] ∧ d = 3)

/-- `README.md`, Layer 5, 5.3. Every Singerman pair satisfies `μ(σ) = d μ(σ')`. -/
theorem IsSingermanPair.mu_eq {σ σ' : Signature} {d : ℕ} (h : IsSingermanPair σ σ' d) :
    σ.mu = d * σ'.mu := by
  sorry

/-! ## Layers 6–7: fixed points, the hgcwa predicates, Chevalley–Weil -/

open Classical in
/-- `README.md`, Layer 6, 6.1. Macbeath's fixed-point count of `γ ≠ 1`, computed from the
generating vector, in the centralizer form `|C_G(γ)| · Σ_j #(cl(γ) ∩ ⟨c_j⟩)/m_j`, which equals
Macbeath's `|N_G⟨γ⟩| · Σ_j ε_j(γ)/m_j` with `ε_j(γ) = 1` iff `γ` is conjugate to a power of `c_j`. -/
noncomputable def GenVector.numFixedPoints {σ : Signature} (v : GenVector G σ) (γ : G) : ℚ :=
  Nat.card (Subgroup.centralizer ({γ} : Set G)) *
    ∑ j, (Nat.card {k : Fin (σ.m j) // IsConj γ (v.c j ^ (k : ℕ))} : ℚ) / σ.m j

/-- `README.md`, Layer 6, 6.1. The count is a natural number, invariant under simultaneous
conjugation, and at most `2g + 2`. -/
theorem GenVector.numFixedPoints_le [Finite G] {σ : Signature} (v : GenVector G σ)
    (hσ : σ.IsHyperbolic) (γ : G) (hγ : γ ≠ 1) :
    (∃ n : ℕ, v.numFixedPoints γ = n) ∧
      v.numFixedPoints γ ≤ 2 * σ.genusOfOrder (Nat.card G) + 2 := by
  sorry

/-- `README.md`, Layer 6, 6.2. The hyperelliptic criterion on `G`: an involution with `2g + 2`
fixed points. -/
def GenVector.IsHyperellipticVector [Finite G] {σ : Signature} (v : GenVector G σ) : Prop :=
  ∃ ι : G, orderOf ι = 2 ∧ v.numFixedPoints ι = 2 * σ.genusOfOrder (Nat.card G) + 2

/-- `README.md`, Layer 6, 6.4. The cyclic-trigonal criterion on `G`: an element of order `3`
with `g + 2` fixed points. -/
def GenVector.IsCyclicTrigonalVector [Finite G] {σ : Signature} (v : GenVector G σ) : Prop :=
  ∃ τ : G, orderOf τ = 3 ∧ v.numFixedPoints τ = σ.genusOfOrder (Nat.card G) + 2

/-- `README.md`, Layer 6, 6.2. The non-vacuity check: the genus-two hyperelliptic vector is
hyperelliptic (`#Fix ι = 2 · 6/2 = 6 = 2·2 + 2`). -/
theorem hyperellipticGenusTwoVector_isHyperelliptic :
    hyperellipticGenusTwoVector.IsHyperellipticVector := by
  sorry

/-- `README.md`, Layer 7, 7.2. The Chevalley–Weil multiplicity `⟨χ_ρ, χ_Ω⟩` of a representation
`ρ` in `H⁰(X, Ω)` (pinned convention 10: `ρ_Ω(γ) = (γ⁻¹)^*`), computed from the generating vector:
`χ_ρ(1)(h − 1) + Σ_j Σ_{k=1}^{m_j−1} N_{j,k}(ρ) · k/m_j + dim V^G`, where `N_{j,k}(ρ)` is the
multiplicity of the eigenvalue `exp(2πi/m_j)^k` of `ρ (c j)` (`exp(2πi/m_j)` is the rotation
constant of `c j` at its fixed points under convention 8) and the last term is the multiplicity of
the trivial constituent, so the expression is additive in `ρ`. The weight is `k/m_j`, not
`(m_j − k)/m_j`: the latter is the formula for the contravariant action `γ ↦ γ^*` (README 7.2 and
the `y² = x⁵ − 1` check). -/
noncomputable def GenVector.chevalleyWeilMultiplicity {σ : Signature} (v : GenVector G σ)
    {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (ρ : Representation ℂ G V) : ℚ :=
  (Module.finrank ℂ V : ℚ) * ((σ.h : ℚ) - 1) +
    ∑ j, ∑ k ∈ Finset.Ico 1 (σ.m j),
      (Module.finrank ℂ (Module.End.eigenspace (ρ (v.c j))
          (Complex.exp (2 * Real.pi * Complex.I / σ.m j) ^ k)) : ℚ) *
        ((k : ℚ) / σ.m j) +
    (Module.finrank ℂ ρ.invariants : ℚ)

/-- `README.md`, Layer 7, 7.2. The multiplicities sum to the genus over the irreducible
representations: `Σ_ρ χ_ρ(1) · mult(ρ) = g`. Stated here for the regular representation,
which contains each irreducible `χ_ρ(1)` times. -/
theorem GenVector.chevalleyWeilMultiplicity_regular [Finite G] {σ : Signature} (v : GenVector G σ)
    (hσ : σ.IsHyperbolic) :
    v.chevalleyWeilMultiplicity (Representation.ofMulAction ℂ G G) =
      σ.genusOfOrder (Nat.card G) := by
  sorry

end TauCetiRoadmap.GroupActionsOnRiemannSurfaces
