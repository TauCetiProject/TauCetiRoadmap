module

public import Mathlib
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Nilpotent
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperTriangular.Basic
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic

/-!
# Continuous cohomology of profinite groups, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states the headline theorems the finished roadmap proves, each with `sorry`, against the pinned
Mathlib and Tau Ceti, together with the few definitions needed to state them.

Headline theorems stated here:

* Dwyer's criteria (Layer 1): a degree-one `n`-fold Massey product with trivial coefficients in a
  discrete commutative ring is defined exactly when the adjacent characters lift to `Uₙ₊₁(R)/Z`,
  and contains zero exactly when they lift to `Uₙ₊₁(R)`
  (`masseyDefined_iff_exists_lift`, `masseyContainsZero_iff_exists_lift`);
* outer powering in small rank: for `n ≤ 6`, every power `Q ^ a` with `a ≡ 1 (mod p)` of an element
  `Q` of the derived subgroup `U¹` of `Uₙ₊₁(𝔽_p)` is conjugate to `Q` in `U¹` (Layer 3,
  `isConj_pow_superdiagonalSubgroup_two`);
* the vanishing of the Bogomolov multiplier of the derived subgroup `U¹` of `Uₙ₊₁(𝔽_p)`
  (Layer 4, `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`);
* refined lifting through the two-boundary subgroup `P_{r,s}` at every local field, archimedean or
  not (Layers 7 and 8, `refinedLocalLifting`);
* Massey vanishing for `𝔽_p` coefficients at every local field (Layer 8, `localMasseyVanishing`);
* refined lifting for upper triangular groups, that is for rank-one twisted coefficients
  (Layer 10, `twistedRefinedLocalLifting`);
* a triple Massey product of three characters `Γ_ℚ → ℤ/8` that is defined and does not contain
  zero (Layer 11, `exists_masseyDefined_not_masseyContainsZero_zmod_eight`).

Every end theorem named in the README's summary is stated. The defining systems here have trivial
coefficients in a discrete commutative ring, which is the generality of every headline theorem. The
general continuous cochain algebra, its comparison with continuous cohomology and the twisted
defining systems of Layer 9 are README targets, not headline theorems: the generic carriers exist at
the pins (Tau Ceti's `TauCeti.IsDGAlgebra` and `TauCeti.DGCategoryData`), but the objects to be
placed in them (the internally graded algebra of continuous inhomogeneous cochains with its
translated cup, and the Hom-coefficient cochain category) are constructions of this roadmap and are
not made here.

Two finite-group results consumed downstream are not stated: the vanishing of `H¹_cyc(G, B_bdry^D)`
(README 5.6) and fixed-class generation for `n = 4, 5` (README 5.7). Their carriers, the module
`B = U¹/U³` with its action of `U/U¹`, the boundary submodule `B_bdry`, its dual twisted by a
character and the cyclic restriction kernel `H¹_cyc`, are definitions of this roadmap and not of the
pinned libraries.

Continuity of a homomorphism into a finite (or discrete) group is written as openness of its
kernel, as in Tau Ceti's `TauCeti.FiniteEmbeddingProblem`. The absolute Galois group is Tau Ceti's
`TauCeti.AbsoluteGaloisGroup K = Gal(Kˢ/K)` with its Krull topology.
-/

@[expose] public section

namespace TauCetiRoadmap.ProfiniteCohomologyPartII

open TauCeti CategoryTheory

/-! ## Layer 0: continuous cochains and degree-one defining systems -/

/-- A **defining system** for the `n`-fold Massey product of the cochains `χ 0, …, χ (n - 1)`,
with coefficients in a discrete commutative ring `R` on which `Γ` acts trivially.

The entries `entry i j : Γ → R` are continuous `1`-cochains. The adjacent entries are the given
cochains, and for `i < j` with `(i, j) ≠ (0, n)` the entry satisfies Kraines' defining equation
`d a_{ij} = - ∑_{i<m<j} a_{im} ∪ a_{mj}` (Harpaz–Wittenberg, Introduction, p. 1). With the
inhomogeneous differential `(d f)(g, h) = f h - f (g * h) + f g` of trivial coefficients and the
cup product `(a ∪ b)(g, h) = a g * b h`, that equation is `entry_mul`: the entries multiply like
the entries of an upper unitriangular matrix. The entries with `i ≥ j`, and the corner entry
`(0, n)` when `n ≥ 2`, are zero (`entry_eq_zero`), so a defining system is determined by its
permitted entries; for `n = 1` the corner is the adjacent entry `χ 0`. -/
structure DefiningSystem (Γ : Type*) [Group Γ] [TopologicalSpace Γ] (R : Type*) [CommRing R]
    [TopologicalSpace R] [DiscreteTopology R] (n : ℕ) (χ : Fin n → Γ → R) where
  /-- The `(i, j)` entry, a `1`-cochain. -/
  entry : Fin (n + 1) → Fin (n + 1) → Γ → R
  /-- Every entry is continuous. -/
  continuous_entry : ∀ i j, Continuous (entry i j)
  /-- The adjacent entries are the given cochains. -/
  entry_castSucc_succ : ∀ i : Fin n, entry i.castSucc i.succ = χ i
  /-- The defining equation `d a_{ij} = - ∑_{i<m<j} a_{im} ∪ a_{mj}` away from the corner. -/
  entry_mul : ∀ i j : Fin (n + 1), i < j → ¬ (i = 0 ∧ j = Fin.last n) → ∀ g h : Γ,
    entry i j (g * h) =
      entry i j g + entry i j h + ∑ m ∈ Finset.Ioo i j, entry i m g * entry m j h
  /-- The entries that are not permitted vanish: those on or below the diagonal, and the corner
  `(0, n)` when it is not adjacent. -/
  entry_eq_zero : ∀ i j : Fin (n + 1), (j ≤ i ∨ (i = 0 ∧ j = Fin.last n ∧ 2 ≤ n)) →
    entry i j = 0

/-- The **value** of a defining system: the `2`-cocycle `- ∑_{0<m<n} a_{0m} ∪ a_{mn}`, that is
`(g, h) ↦ - ∑_{0<m<n} a_{0m}(g) a_{mn}(h)` (Harpaz–Wittenberg, Introduction, p. 1). -/
def DefiningSystem.value {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {R : Type*} [CommRing R]
    [TopologicalSpace R] [DiscreteTopology R] {n : ℕ} {χ : Fin n → Γ → R}
    (D : DefiningSystem Γ R n χ)
    (x : Γ × Γ) : R :=
  -∑ m ∈ Finset.Ioo (0 : Fin (n + 1)) (Fin.last n), D.entry 0 m x.1 * D.entry m (Fin.last n) x.2

/-- The `n`-fold Massey product of `χ` is **defined**: it has a defining system. -/
def MasseyDefined {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {R : Type*} [CommRing R]
    [TopologicalSpace R] [DiscreteTopology R] {n : ℕ} (χ : Fin n → Γ → R) : Prop :=
  Nonempty (DefiningSystem Γ R n χ)

/-- The `n`-fold Massey product of `χ` **contains zero**: some defining system has value the
coboundary `(g, h) ↦ f h - f (g * h) + f g` of a continuous cochain `f`. -/
def MasseyContainsZero {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {R : Type*} [CommRing R]
    [TopologicalSpace R] [DiscreteTopology R] {n : ℕ} (χ : Fin n → Γ → R) : Prop :=
  ∃ D : DefiningSystem Γ R n χ, ∃ f : Γ → R, Continuous f ∧
    ∀ g h : Γ, D.value (g, h) = f h - f (g * h) + f g

/-! ## Layer 1: unitriangular quotients and Dwyer's criteria -/

/-- **Dwyer's criterion for definedness** (Dwyer; Harpaz–Wittenberg, Proposition 2.2 and
Corollary 2.3(1), p. 5). Let `R` be a discrete commutative ring with trivial action and `n ≥ 2`.
The `n`-fold Massey product of `χ` is defined exactly when there is a continuous homomorphism
`β : Γ → Uₙ₊₁(R)/Z`, `Z` the centre (the corner subgroup), whose adjacent entries are the `χ i`. -/
theorem masseyDefined_iff_exists_lift {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] {R : Type*} [CommRing R] [TopologicalSpace R] [DiscreteTopology R]
    {n : ℕ} (hn : 2 ≤ n) (χ : Fin n → Γ → R) :
    MasseyDefined χ ↔
      ∃ β : Γ →* upperUnitriangularGroup (Fin (n + 1)) R ⧸
          Subgroup.center (upperUnitriangularGroup (Fin (n + 1)) R),
        IsOpen (β.ker : Set Γ) ∧
          ∀ g : Γ, ∃ u : upperUnitriangularGroup (Fin (n + 1)) R,
            (QuotientGroup.mk u : upperUnitriangularGroup (Fin (n + 1)) R ⧸
                Subgroup.center (upperUnitriangularGroup (Fin (n + 1)) R)) = β g ∧
              ∀ i : Fin n, ((u : GL (Fin (n + 1)) R) : Matrix (Fin (n + 1)) (Fin (n + 1)) R)
                i.castSucc i.succ = χ i g := by
  sorry

/-- **Dwyer's criterion for zero-membership** (Dwyer; Harpaz–Wittenberg, Proposition 2.2 and
Corollary 2.3(2), p. 5). Let `R` be a discrete commutative ring with trivial action and `n ≥ 2`.
The `n`-fold Massey product of `χ` contains zero exactly when there is a continuous homomorphism
`β : Γ → Uₙ₊₁(R)` whose adjacent entries are the `χ i`. No surjectivity is asked of `β`. -/
theorem masseyContainsZero_iff_exists_lift {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] {R : Type*} [CommRing R] [TopologicalSpace R] [DiscreteTopology R]
    {n : ℕ} (hn : 2 ≤ n) (χ : Fin n → Γ → R) :
    MasseyContainsZero χ ↔
      ∃ β : Γ →* upperUnitriangularGroup (Fin (n + 1)) R,
        IsOpen (β.ker : Set Γ) ∧
          ∀ (g : Γ) (i : Fin n),
            ((β g : GL (Fin (n + 1)) R) : Matrix (Fin (n + 1)) (Fin (n + 1)) R)
              i.castSucc i.succ = χ i g := by
  sorry

/-! ## Layer 3: nilpotent support and outer exponents -/

/-- **Outer powering in small rank** (HW, Lemma 4.7, p. 14, with the least divisor `1` at
`p = 2`). Let `p` be a prime and `n ≤ 6`. For every `Q` in the derived subgroup `U¹` of
`Uₙ₊₁(𝔽_p)`, Tau Ceti's `UpperUnitriangularGroup.superdiagonalSubgroup 2`, and every `a ≡ 1 (mod p)`,
the power `Q ^ a` is conjugate to `Q` inside `U¹`. Equivalently, powering by units on the conjugacy
classes of `U¹` factors through `(ℤ/p)ˣ`. -/
theorem isConj_pow_superdiagonalSubgroup_two (p : ℕ) [Fact p.Prime] {n : ℕ} (hn : n ≤ 6)
    (Q : UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2) {a : ℕ}
    (ha : a ≡ 1 [MOD p]) :
    IsConj Q (Q ^ a) := by
  sorry

/-! ## Layer 4: Bogomolov vanishing for the derived stabilizer -/

/-- The **Bogomolov multiplier** `B₀(G)` of a group `G`: the classes of `H²(G, ℚ/ℤ)`, trivial
coefficients, whose restriction to every abelian subgroup vanishes (Moravec, (3.0.1), p. 4;
Harpaz–Wittenberg, (4.1), p. 12). Here `ℚ/ℤ` is `ℚ ⧸ ℤ·1` and the restriction to a subgroup `A` is
Mathlib's `groupCohomology.map` along the inclusion of `A`. -/
noncomputable def bogomolovMultiplier (G : Type) [Group G] :
    Submodule ℤ (groupCohomology (Rep.trivial ℤ G (ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ))) 2) :=
  ⨅ (A : Subgroup G) (_ : ∀ x ∈ A, ∀ y ∈ A, x * y = y * x),
    LinearMap.ker (groupCohomology.map A.subtype
      (𝟙 (Rep.res A.subtype (Rep.trivial ℤ G (ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ))))) 2).hom

/-- **The Bogomolov multiplier of the derived subgroup of `Uₙ₊₁(𝔽_p)` vanishes** (Michailov,
Theorem 3.1, p. 5; Harpaz–Wittenberg, proof of Proposition 4.1, pp. 11–12). The derived subgroup
`U¹` is the superdiagonal subgroup `U²` of matrices whose first superdiagonal vanishes, Tau Ceti's
`UpperUnitriangularGroup.superdiagonalSubgroup 2`. -/
theorem bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot (p : ℕ) [Fact p.Prime] (n : ℕ) :
    bogomolovMultiplier
      (UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2) = ⊥ := by
  sorry

/-! ## Layer 7: refined nonarchimedean lifting -/

/-- The support condition of the **two-boundary subgroup** `P_{r,s}` (Harpaz–Wittenberg,
Definition 5.2, p. 18): an `(n+1) × (n+1)` matrix satisfies it when it agrees with the identity
except in row `0` at columns `j ≥ n - s` and in column `n` at rows `i ≤ r`, all strictly above the
diagonal. The corner `(0, n)` lies in both ranges and is one coordinate. In `Uₙ₊₁(R)` the matrices
with this support form a subgroup, normal and containing the centre. -/
def IsTwoBoundary {R : Type*} [Zero R] [One R] (n r s : ℕ)
    (M : Matrix (Fin (n + 1)) (Fin (n + 1)) R) : Prop :=
  ∀ i j : Fin (n + 1), M i j ≠ (1 : Matrix (Fin (n + 1)) (Fin (n + 1)) R) i j →
    i < j ∧ ((i = 0 ∧ n ≤ (j : ℕ) + s) ∨ (j = Fin.last n ∧ (i : ℕ) ≤ r))

/-! ## Layer 8: real places and local Massey vanishing -/

/-- `K` is a **local field**: a nonarchimedean local field for some valuative relation and
compatible topology (a complete discretely valued field with finite residue field), or a field
isomorphic to `ℝ` or to `ℂ`. Harpaz–Wittenberg (p. 19) reserve the name for the nonarchimedean
case; the archimedean fields are included because every completion of a number field is used. -/
def IsLocalField (K : Type) [Field K] : Prop :=
  (∃ (_ : ValuativeRel K) (_ : TopologicalSpace K), IsNonarchimedeanLocalField K) ∨
    Nonempty (K ≃+* ℝ) ∨ Nonempty (K ≃+* ℂ)

/-- **Refined local lifting** (Harpaz–Wittenberg, Proposition 5.3, p. 19, extended to the
archimedean fields). Let `K` be a local field, `p` a prime, `r, s ≥ 1` and `n = r + s + 1`, and
`U = Uₙ₊₁(𝔽_p)` with centre `Z`. Every continuous homomorphism `ρ : Γ_K → U/Z` agrees modulo
`P_{r,s}` with a continuous homomorphism `ρ' : Γ_K → U`: the image of `ρ` in `U/P_{r,s}`, which
lifts to `U/Z` by construction, lifts to `U`. -/
theorem refinedLocalLifting (K : Type) [Field K] (hK : IsLocalField K) (p : ℕ) [Fact p.Prime]
    {n r s : ℕ} (hr : 1 ≤ r) (hs : 1 ≤ s) (hrs : r + s + 1 = n)
    (ρ : AbsoluteGaloisGroup K →* upperUnitriangularGroup (Fin (n + 1)) (ZMod p) ⧸
      Subgroup.center (upperUnitriangularGroup (Fin (n + 1)) (ZMod p)))
    (hρ : IsOpen (ρ.ker : Set (AbsoluteGaloisGroup K))) :
    ∃ ρ' : AbsoluteGaloisGroup K →* upperUnitriangularGroup (Fin (n + 1)) (ZMod p),
      IsOpen (ρ'.ker : Set (AbsoluteGaloisGroup K)) ∧
        ∀ g : AbsoluteGaloisGroup K, ∃ x : upperUnitriangularGroup (Fin (n + 1)) (ZMod p),
          IsTwoBoundary n r s
              ((x : GL (Fin (n + 1)) (ZMod p)) : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod p)) ∧
            (QuotientGroup.mk (ρ' g * x) : upperUnitriangularGroup (Fin (n + 1)) (ZMod p) ⧸
              Subgroup.center (upperUnitriangularGroup (Fin (n + 1)) (ZMod p))) = ρ g := by
  sorry

/-- **Local Massey vanishing** (Mináč–Tân; Harpaz–Wittenberg, Remark 5.4, p. 19). For every local
field `K`, archimedean or not, every prime `p` and every `n ≥ 3`, an `n`-fold Massey product of
classes of `H¹(K, 𝔽_p)` that is defined contains zero. -/
theorem localMasseyVanishing (K : Type) [Field K] (hK : IsLocalField K) (p : ℕ) [Fact p.Prime]
    {n : ℕ} (hn : 3 ≤ n) (χ : Fin n → AbsoluteGaloisGroup K → ZMod p)
    (hχ : MasseyDefined χ) :
    MasseyContainsZero χ := by
  sorry

/-! ## Layer 10: rank-one twisted local lifting -/

/-- The **corner subgroup** `Z(W)` of the upper triangular group `Tₙ₊₁(R)`: the normal closure of
the invertible upper triangular matrices that differ from the identity only at entries strictly
above the diagonal in position `(0, n)`. For `n ≥ 1` these matrices already form a normal
subgroup, isomorphic to `(R, +)`, central in `Uₙ₊₁(R)` but not in `Tₙ₊₁(R)`; for `n = 0` the
entry `(0, 0)` is diagonal and excluded, so the generating set is `{1}` and the subgroup is trivial
(Harpaz–Wittenberg, §7, p. 26). -/
def triangularCorner (R : Type*) [CommRing R] (n : ℕ) :
    Subgroup (upperTriangularGroup (Fin (n + 1)) R) :=
  Subgroup.normalClosure
    {g | ∀ i j : Fin (n + 1),
      ((g : GL (Fin (n + 1)) R) : Matrix (Fin (n + 1)) (Fin (n + 1)) R) i j ≠
          (1 : Matrix (Fin (n + 1)) (Fin (n + 1)) R) i j →
        i < j ∧ i = 0 ∧ j = Fin.last n}

/-- The corner subgroup is normal in `Tₙ₊₁(R)`, being a normal closure; this is what makes the
quotient `Tₙ₊₁(R)/Z(W)` a group. -/
instance triangularCorner.normal (R : Type*) [CommRing R] (n : ℕ) :
    (triangularCorner R n).Normal :=
  Subgroup.normalClosure_normal

/-- **Rank-one twisted refined local lifting** (Harpaz–Wittenberg, local step of the proof of
Theorem 7.4, p. 28, for every local field). Let `K` be a local field, `p` a prime, `r, s ≥ 1`,
`n = r + s + 1`, and `T = Tₙ₊₁(𝔽_p)` the invertible upper triangular matrices, which is the group
of filtered automorphisms of a sum of `n + 1` one-dimensional `𝔽_p`-modules. Every continuous
homomorphism `ρ : Γ_K → T/Z(W)` agrees modulo `P_{r,s}` with a continuous homomorphism
`ρ' : Γ_K → T`. The diagonal of `ρ` (the twisting characters) is arbitrary. -/
theorem twistedRefinedLocalLifting (K : Type) [Field K] (hK : IsLocalField K) (p : ℕ)
    [Fact p.Prime] {n r s : ℕ} (hr : 1 ≤ r) (hs : 1 ≤ s) (hrs : r + s + 1 = n)
    (ρ : AbsoluteGaloisGroup K →* upperTriangularGroup (Fin (n + 1)) (ZMod p) ⧸
      triangularCorner (ZMod p) n)
    (hρ : IsOpen (ρ.ker : Set (AbsoluteGaloisGroup K))) :
    ∃ ρ' : AbsoluteGaloisGroup K →* upperTriangularGroup (Fin (n + 1)) (ZMod p),
      IsOpen (ρ'.ker : Set (AbsoluteGaloisGroup K)) ∧
        ∀ g : AbsoluteGaloisGroup K, ∃ x : upperTriangularGroup (Fin (n + 1)) (ZMod p),
          IsTwoBoundary n r s
              ((x : GL (Fin (n + 1)) (ZMod p)) : Matrix (Fin (n + 1)) (Fin (n + 1)) (ZMod p)) ∧
            (QuotientGroup.mk (ρ' g * x) : upperTriangularGroup (Fin (n + 1)) (ZMod p) ⧸
              triangularCorner (ZMod p) n) = ρ g := by
  sorry

/-! ## Layer 11: the defined non-vanishing `ℤ/8` triple -/

/-- **A defined triple Massey product over `ℚ` with `ℤ/8` coefficients that does not contain
zero** (Harpaz–Wittenberg, Theorem 7.5, p. 28). There are continuous characters
`χ₀₁, χ₁₂, χ₂₃ : Γ_ℚ → ℤ/8` whose triple Massey product is defined and does not contain zero; so
Massey vanishing fails over number fields for the coefficient ring `ℤ/8`. -/
theorem exists_masseyDefined_not_masseyContainsZero_zmod_eight :
    ∃ χ : Fin 3 → AbsoluteGaloisGroup ℚ → ZMod 8, MasseyDefined χ ∧ ¬ MasseyContainsZero χ := by
  sorry

end TauCetiRoadmap.ProfiniteCohomologyPartII
