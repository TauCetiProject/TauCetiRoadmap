import Mathlib

/-!
# Mapping class groups and canonical representations of surface groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few simple
definitions they need: the standard presentation of the fundamental group of a genus-`g` surface
with `n` punctures (`surfaceGroup`, the presented surface group of FreeGroupsAndLimitGroups §6.1 in
the commutator convention `x y x⁻¹ y⁻¹`), its peripheral loops, the algebraic pure mapping class
group (`pureMappingClassAut`, the automorphisms sending each peripheral loop to a conjugate of
itself), finiteness of an orbit of conjugacy classes (`HasFiniteConjugacyOrbitUnder`), and, for the
higher Prym representations, the stabiliser of a finite quotient (`prymStabilizer`), the cohomology
of the compactified cover (`compactPrymCohomology`) and the isotypic parts of the cohomology of the
cover for the deck-group action (`prymIsotypic`). The image of the topological pure mapping class
group in the automorphism group of the surface group lies in `pureMappingClassAut`, so each
statement below is implied by the corresponding topological statement of the README (README
Layer 0, §0.2).

Stated here:

* `mcgFinite_finite_image`: an MCG-finite representation of rank `r` with `r² < g + 1` has finite
  image (Landesman–Litt, Theorem 1.2.1; README Layer 9).
* `freeGroup_finite_image`: the free-group form, for `N = 2g` or `2g + 1` (Landesman–Litt,
  Corollary 1.6.1; README Layer 9).
* `higherPrym_rank_bound`: every nonzero subspace of the `σ`-isotypic part of the cohomology of a
  finite cover that is stable under a finite-index subgroup of the stabiliser has dimension at
  least `2g − 2 dim σ` (Landesman–Litt, Theorem 7.2.1; README Layer 6). Its case of a line spanned
  by one vector is the isotypic orbit theorem (Landesman–Litt, Theorem 1.4.2), which is therefore
  not stated separately.
* `putmanWieland_of_irreducible_dim_lt`: the Putman–Wieland property for finite groups all of whose
  irreducible complex representations have dimension `< g`, in its equivalent form "no nonzero class
  of the compactified cover is fixed by a finite-index subgroup of the stabiliser" (Landesman–Litt,
  Corollary 7.2.3; README Layer 6).
* `putmanWieland_of_card_lt`: the same property for finite groups of order `< g²` (Landesman–Litt,
  Corollary 7.2.4 and Theorem 1.4.1; README Layer 6).
* `rankTwo_mcgFinite_finite_image`: in every genus `g ≥ 2`, an MCG-finite representation of rank two
  has finite image (Landesman–Litt, Remark 10.2.2, with Biswas–Gupta–Mj–Whang, Theorem A, and
  Cousin–Heu, Theorem B; README Layer 12).

Headline theorems of the README that are not statable at the pins, with what each lacks:

* The rank bound for sub-local systems of `R¹π°_* V` on a punctured étale-versal family
  (Landesman–Litt, Theorem 1.7.1), the Artinian vanishing theorem (Theorem 6.2.1) and finite
  fibral monodromy on versal families (Corollary 1.3.1): the pins have no moduli stack of pointed
  curves, hence no étale-versal family, no smooth proper families of complex curves with their
  relative Betti local systems, and no higher direct images of local systems along such families
  (Tau Ceti's higher direct images are those of sheaves of modules on schemes).
* The algebraic isomonodromy criterion (Corollary 1.2.3): no isomonodromic deformations and no
  logarithmic connections on families of curves.
* Arithmetic finite monodromy on the generic pointed curve (Theorem 9.1.2), its Hodge
  characterisation (Corollary 9.1.4) and residual non-lifting (Corollary 9.2.2): the étale
  fundamental group of a scheme at a geometric point exists at the pins, as the automorphisms of
  Tau Ceti's fibre functor `TauCeti.FiniteEtaleScheme.fiber`, but there is no moduli stack of
  pointed curves over `ℚ`, so the generic pointed curve cannot be named, no outer action of `Γ_K`
  on the geometric fundamental group of a variety over `K`, and no polarizable variations of Hodge
  structure.

The other results of README Layer 12 are examples showing that hypotheses and ranges are needed
(unipotent, genus-one and large-rank semisimple examples); they are range checks and stay in the
README.
-/

namespace TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations

open Matrix

/-! ## Layer 0: surfaces with punctures, pure mapping class groups and point-pushing -/

/-- The relator `∏ᵢ [aᵢ, bᵢ] · ∏ⱼ cⱼ` of the standard presentation of the fundamental group of a
genus-`g` surface with `n` punctures, on the generators `aᵢ = of (inl i)`, `bᵢ = of (inr (inl i))`
and `cⱼ = of (inr (inr j))`, with the commutator `[x, y] = x * y * x⁻¹ * y⁻¹`. -/
def surfaceRelator (g n : ℕ) : FreeGroup (Fin g ⊕ Fin g ⊕ Fin n) :=
  ((List.finRange g).map fun i =>
      FreeGroup.of (Sum.inl i) * FreeGroup.of (Sum.inr (Sum.inl i)) *
        (FreeGroup.of (Sum.inl i))⁻¹ * (FreeGroup.of (Sum.inr (Sum.inl i)))⁻¹).prod *
    ((List.finRange n).map fun j => FreeGroup.of (Sum.inr (Sum.inr j))).prod

/-- The fundamental group of an oriented genus-`g` surface with `n` punctures, in its standard
presentation `⟨a₁, b₁, …, a_g, b_g, c₁, …, c_n | ∏ᵢ [aᵢ, bᵢ] ∏ⱼ cⱼ⟩` (Hatcher, §1.2, p. 51;
Landesman–Litt 2022, proof of Lemma 7.5.1). For `n ≥ 1` it is free of rank `2g + n − 1`. It is the
presented surface group of FreeGroupsAndLimitGroups §6.1, whose commutator is `x⁻¹ y⁻¹ x y`,
transported along the inversion of the handle generators `aᵢ ↦ aᵢ⁻¹`, `bᵢ ↦ bᵢ⁻¹`. -/
def surfaceGroup (g n : ℕ) : Type :=
  PresentedGroup ({surfaceRelator g n} : Set (FreeGroup (Fin g ⊕ Fin g ⊕ Fin n)))

/-- The group structure of `surfaceGroup g n`, inherited from the presented group. -/
instance (g n : ℕ) : Group (surfaceGroup g n) :=
  inferInstanceAs (Group (PresentedGroup _))

/-- The `j`-th peripheral loop `cⱼ`, a loop around the `j`-th puncture. -/
def peripheralLoop {g n : ℕ} (j : Fin n) : surfaceGroup g n :=
  PresentedGroup.of (Sum.inr (Sum.inr j))

/-- The algebraic pure mapping class group: automorphisms of the surface group sending every
peripheral loop to a conjugate of itself. Every orientation-preserving homeomorphism fixing a base
point and each puncture induces such an automorphism, so the based action of the pure mapping
class group `PMod(g, n + 1)` lands here; by the Dehn–Nielsen–Baer theorem the image is all of it
up to orientation (Farb–Margalit, §8.2). For `n = 0` this is the whole automorphism group. -/
def pureMappingClassAut (g n : ℕ) : Subgroup (MulAut (surfaceGroup g n)) where
  carrier := {φ | ∀ j : Fin n, ∃ h : surfaceGroup g n,
    φ (peripheralLoop j) = h * peripheralLoop j * h⁻¹}
  one_mem' := fun j => ⟨1, by simp⟩
  mul_mem' := by
    intro φ ψ hφ hψ j
    obtain ⟨h, hh⟩ := hψ j
    obtain ⟨k, hk⟩ := hφ j
    refine ⟨φ h * k, ?_⟩
    simp only [MulAut.mul_apply, hh, map_mul, map_inv, hk]
    group
  inv_mem' := by
    intro φ hφ j
    obtain ⟨h, hh⟩ := hφ j
    refine ⟨(φ⁻¹ h)⁻¹, ?_⟩
    have h2 : peripheralLoop j = φ⁻¹ h * φ⁻¹ (peripheralLoop j) * (φ⁻¹ h)⁻¹ := by
      have := congrArg (fun x => φ⁻¹ x) hh
      simpa [map_mul, map_inv] using this
    generalize φ⁻¹ (peripheralLoop j) = x at h2 ⊢
    generalize φ⁻¹ h = y at h2 ⊢
    rw [h2]
    group

/-! ## Layer 2: finite orbits and surface monodromy -/

/-- A homomorphism `ρ : G → GL_r(ℂ)` has finite orbit of conjugacy classes under a group `H` of
automorphisms of `G`: finitely many homomorphisms represent, up to actual `GL_r(ℂ)`-conjugation,
every pullback `ρ ∘ φ` with `φ ∈ H`. No semisimplification is taken. Inner automorphisms change
`ρ` only by conjugation, so for `H` containing them this is finiteness of the orbit under the
outer action (Landesman–Litt, Definition 1.1.1). -/
def HasFiniteConjugacyOrbitUnder {G : Type*} [Group G] {r : ℕ} (H : Subgroup (MulAut G))
    (ρ : G →* GL (Fin r) ℂ) : Prop :=
  ∃ S : Set (G →* GL (Fin r) ℂ), S.Finite ∧
    ∀ φ ∈ H, ∃ σ ∈ S, ∃ A : GL (Fin r) ℂ, ∀ x : G, ρ (φ x) = A * σ x * A⁻¹

/-! ## Layer 6: higher Prym representations and the Putman–Wieland property -/

/-- The stabiliser of a homomorphism `ϕ : π₁(Σ_{g,n}) → H` up to conjugacy in `H`: the elements
of the algebraic pure mapping class group with `ϕ ∘ φ = c_h ∘ ϕ` for some `h ∈ H`. It contains every
inner automorphism. When `H` is finite and `ϕ` is surjective it is the algebraic form of the
finite-index subgroup `Γ` of Landesman–Litt, Notation 7.1.1, which lies in it. -/
def prymStabilizer {g n : ℕ} {H : Type*} [Group H] (ϕ : surfaceGroup g n →* H) :
    Subgroup (MulAut (surfaceGroup g n)) :=
  pureMappingClassAut g n ⊓
    { carrier := {φ | ∃ h : H, ∀ x, ϕ (φ x) = h * ϕ x * h⁻¹}
      one_mem' := ⟨1, by simp⟩
      mul_mem' := by
        rintro φ ψ ⟨h, hh⟩ ⟨k, hk⟩
        exact ⟨h * k, fun x => by simp only [MulAut.mul_apply, hh, hk]; group⟩
      inv_mem' := by
        rintro φ ⟨h, hh⟩
        refine ⟨h⁻¹, fun x => ?_⟩
        have := hh (φ⁻¹ x)
        simp only [MulAut.apply_inv_self] at this
        rw [this]
        group }

/-- The additive characters of `ker ϕ` with values in `ℂ` vanishing on every element of `ker ϕ`
conjugate in the surface group to a power of a peripheral loop. When `H` is finite and `ϕ` is
surjective, `Hom(ker ϕ, ℂ)` is the cohomology `H¹(Σ_{g',n'}, ℂ)` of the corresponding finite cover,
those elements are the loops around its punctures, and this subspace is the first cohomology
`H¹(Σ_{g'}, ℂ)` of the compactified cover. For an infinite quotient it is only this algebraic
subspace. -/
def compactPrymCohomology {g n : ℕ} {H : Type*} [Group H] (ϕ : surfaceGroup g n →* H) :
    Submodule ℂ (Additive ϕ.ker →+ ℂ) where
  carrier := {f | ∀ (k : ϕ.ker) (h : surfaceGroup g n) (j : Fin n) (m : ℤ),
    (k : surfaceGroup g n) = h * peripheralLoop j ^ m * h⁻¹ → f (Additive.ofMul k) = 0}
  add_mem' := by
    intro f₁ f₂ h₁ h₂ k h j m hk
    simp [h₁ k h j m hk, h₂ k h j m hk]
  zero_mem' := by
    intro k h j m _
    simp
  smul_mem' := by
    intro c f hf k h j m hk
    simp [hf k h j m hk]

/-- The `σ`-isotypic part of `Hom(ker ϕ, ℂ)`, for a representation `σ` of `H` on `ℂ^d`: the sum of
the images of all linear maps `T : ℂ^d → Hom(ker ϕ, ℂ)` intertwining `σ ∘ ϕ` with the action of the
surface group by conjugation, `(x · f)(k) = f(x⁻¹ k x)`. Elements of `ker ϕ` act trivially, since
`f` is additive on `ker ϕ`, so this is an action of the image of `ϕ`. When `H` is finite and `ϕ` is
surjective it is the deck-group action on the cohomology `H¹(Σ_{g',n'}, ℂ) = Hom(ker ϕ, ℂ)` of the
corresponding cover, and for irreducible `σ` this subspace is the image of
`σ ⊗ Hom_H(σ, Hom(ker ϕ, ℂ))` under evaluation, the `σ`-isotypic component of Landesman–Litt,
Notation 7.1.1. -/
def prymIsotypic {g n : ℕ} {H : Type*} [Group H] (ϕ : surfaceGroup g n →* H) {d : ℕ}
    (σ : Representation ℂ H (Fin d → ℂ)) : Submodule ℂ (Additive ϕ.ker →+ ℂ) :=
  ⨆ (T : (Fin d → ℂ) →ₗ[ℂ] (Additive ϕ.ker →+ ℂ))
    (_ : ∀ (x : surfaceGroup g n) (v : Fin d → ℂ) (k : ϕ.ker),
      T (σ (ϕ x) v) (Additive.ofMul k) = T v (Additive.ofMul (MulAut.conjNormal x⁻¹ k))),
    LinearMap.range T

/-- **The higher Prym rank bound** (Landesman–Litt, Theorem 7.2.1). Let `ϕ : π₁(Σ_{g,n}) → H` be a
surjection onto a finite group and `σ` an irreducible complex representation of `H` of dimension
`d`. Every nonzero subspace `W` of the `σ`-isotypic part of the cohomology `Hom(ker ϕ, ℂ)` of the
cover that is stable under a subgroup `Γ'` of finite index in the stabiliser of `ϕ` has dimension at
least `2g − 2d`, written without truncated subtraction. Stability means that for `γ ∈ Γ'` and
`f ∈ W` the class `k' ↦ f(γ⁻¹ k')` again lies in `W`. -/
theorem higherPrym_rank_bound (g n : ℕ) {H : Type*} [Group H] [Finite H]
    (ϕ : surfaceGroup g n →* H) (hϕ : Function.Surjective ϕ) {d : ℕ}
    (σ : Representation ℂ H (Fin d → ℂ)) (hσ : σ.IsIrreducible)
    (Γ' : Subgroup (MulAut (surfaceGroup g n))) (hΓ' : Γ' ≤ prymStabilizer ϕ)
    (hfin : Γ'.relIndex (prymStabilizer ϕ) ≠ 0)
    (W : Submodule ℂ (Additive ϕ.ker →+ ℂ)) (hWσ : W ≤ prymIsotypic ϕ σ) (hW : W ≠ ⊥)
    (hWΓ : ∀ γ ∈ Γ', ∀ f ∈ W, ∃ f' ∈ W, ∀ k k' : ϕ.ker, (k' : surfaceGroup g n) = γ k →
      f' (Additive.ofMul k') = f (Additive.ofMul k)) :
    2 * g ≤ Module.finrank ℂ W + 2 * d := by
  sorry

/-- **Putman–Wieland for groups of small degree** (Landesman–Litt, Corollary 7.2.3). If every
irreducible complex representation of the finite group `H` has dimension `< g` and
`ϕ : π₁(Σ_{g,n}) → H` is surjective, no nonzero class in the cohomology of the compactified cover is
fixed by a finite-index subgroup of the stabiliser of `ϕ`. Every irreducible representation of a
finite group is finite-dimensional, hence isomorphic to one on `Fin d → ℂ`, so quantifying over
those is the source's hypothesis. -/
theorem putmanWieland_of_irreducible_dim_lt (g n : ℕ) {H : Type*} [Group H] [Finite H]
    (hH : ∀ (d : ℕ) (σ : Representation ℂ H (Fin d → ℂ)), σ.IsIrreducible → d < g)
    (ϕ : surfaceGroup g n →* H) (hϕ : Function.Surjective ϕ)
    (Γ' : Subgroup (MulAut (surfaceGroup g n))) (hΓ' : Γ' ≤ prymStabilizer ϕ)
    (hfin : Γ'.relIndex (prymStabilizer ϕ) ≠ 0) (f : compactPrymCohomology ϕ)
    (hf : ∀ γ ∈ Γ', ∀ k k' : ϕ.ker, (k' : surfaceGroup g n) = γ k →
      (f : Additive ϕ.ker →+ ℂ) (Additive.ofMul k') =
        (f : Additive ϕ.ker →+ ℂ) (Additive.ofMul k)) :
    f = 0 := by
  sorry

/-- **Putman–Wieland for groups of small order** (Landesman–Litt, Corollary 7.2.4 and
Theorem 1.4.1). If `#H < g²` and `ϕ : π₁(Σ_{g,n}) → H` is surjective, no nonzero class in the
cohomology of the compactified cover is fixed by a finite-index subgroup of the stabiliser of `ϕ`.
Equivalently, every nonzero vector of the higher Prym representation has infinite orbit. -/
theorem putmanWieland_of_card_lt (g n : ℕ) {H : Type*} [Group H] [Fintype H]
    (hH : Fintype.card H < g ^ 2) (ϕ : surfaceGroup g n →* H) (hϕ : Function.Surjective ϕ)
    (Γ' : Subgroup (MulAut (surfaceGroup g n))) (hΓ' : Γ' ≤ prymStabilizer ϕ)
    (hfin : Γ'.relIndex (prymStabilizer ϕ) ≠ 0) (f : compactPrymCohomology ϕ)
    (hf : ∀ γ ∈ Γ', ∀ k k' : ϕ.ker, (k' : surfaceGroup g n) = γ k →
      (f : Additive ϕ.ker →+ ℂ) (Additive.ofMul k') =
        (f : Additive ϕ.ker →+ ℂ) (Additive.ofMul k)) :
    f = 0 := by
  sorry

/-! ## Layer 9: the general finiteness theorem and its corollaries -/

/-- **Canonical representations of low rank are finite** (Landesman–Litt, Theorem 1.2.1).
A representation of the fundamental group of a genus-`g` surface with `n` punctures whose
conjugacy class has finite orbit under the pure mapping class group, and whose rank `r` satisfies
`r² < g + 1`, has finite image. No semisimplicity is assumed. -/
theorem mcgFinite_finite_image (g n r : ℕ) (ρ : surfaceGroup g n →* GL (Fin r) ℂ)
    (hρ : HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ) (hr : r ^ 2 < g + 1) :
    (Set.range ρ).Finite := by
  sorry

/-- **The free-group form** (Landesman–Litt, Corollary 1.6.1). For `N = 2g` or `N = 2g + 1`, a
representation of the free group of rank `N` whose conjugacy class has finite orbit under
`Aut(F_N)` (equivalently under `Out(F_N)`), and whose rank `r` satisfies `r² < g + 1`, has finite
image. -/
theorem freeGroup_finite_image (N g r : ℕ) (hN : N = 2 * g ∨ N = 2 * g + 1)
    (ρ : FreeGroup (Fin N) →* GL (Fin r) ℂ) (hρ : HasFiniteConjugacyOrbitUnder ⊤ ρ)
    (hr : r ^ 2 < g + 1) :
    (Set.range ρ).Finite := by
  sorry

/-! ## Layer 12: examples and range checks -/

/-- **Rank two in genus at least two** (Landesman–Litt, Remark 10.2.2; Biswas–Gupta–Mj–Whang,
Theorem A; Cousin–Heu, Theorem B). For `g ≥ 2` and every `n`, a representation of the fundamental
group of a genus-`g` surface with `n` punctures into `GL₂(ℂ)` whose conjugacy class has finite orbit
under the pure mapping class group has finite image. For `g = 2, 3` this lies outside the range
`r² < g + 1` of `mcgFinite_finite_image`; for `g = 1` it fails on punctured tori. -/
theorem rankTwo_mcgFinite_finite_image (g n : ℕ) (hg : 2 ≤ g)
    (ρ : surfaceGroup g n →* GL (Fin 2) ℂ)
    (hρ : HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ) :
    (Set.range ρ).Finite := by
  sorry

end TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations
