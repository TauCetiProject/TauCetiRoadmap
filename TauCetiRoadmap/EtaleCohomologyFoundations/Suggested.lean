module

public import Mathlib
public import TauCeti.AlgebraicGeometry.Compactification.Basic
public import TauCeti.AlgebraicGeometry.FiniteEtale.Fiber

/-!
# Étale cohomology foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries can express, each
with `sorry`, and only the definitions those statements need.

Stated here:

* `nagataCompactification` (§G.2): every separated finite-type morphism to a quasi-compact
  quasi-separated scheme has a compactification, on Tau Ceti's carrier
  `TauCeti.Compactification`.
* `arithmeticExactSequence` (§F.0.A2): for a quasi-compact geometrically connected scheme over a
  field, the étale fundamental groups `EtaleFundamentalGroup` of Tau Ceti's geometric fibre
  functors form the exact sequence `1 → π₁(X_k̄) → π₁(X) → π₁(Spec k) → 1` under the maps
  `EtaleFundamentalGroup.map` induced by morphisms of schemes.
* `VanishingCycles.etaleCohomologicalDimension` (§F.3.0): étale cohomology of a finite-type
  scheme over a separably closed field with prime-to-characteristic torsion coefficients vanishes
  above twice the dimension.
* `VanishingCycles.affineArtinVanishing` (§F.3): on an affine finite-type scheme it vanishes above
  the dimension.
* `VanishingCycles.finite_H_constantSheaf` (§F.3): finiteness of the cohomology of a finite-type
  scheme over a separably closed field with finite constant coefficients of invertible order.
* `VanishingCycles.subsingleton_ellAdicCohomology` (§F.4.4): Mathlib's pro-étale `ℓ`-adic
  cohomology vanishes above twice the dimension.

Headline theorems of the README that cannot be stated at the pins, and what each lacks:

* Proper and smooth base change (§§F.2.1–F.2.2), local acyclicity (§F.2.3) and the lisse
  direct-image theorems (§F.3): no derived or higher direct image `Rf_*` and no pullback map on
  Mathlib's `Sheaf.H` for étale sheaves.
* The canonical lower shriek `Rf_!`, compact-support cohomology, both Künneth formulas, the
  exceptional inverse image, Verdier duality, smooth purity and the Gysin and blow-up formulas
  (§§0.8, F.2.4–F.2.7, F.5–F.7): no `RΓ`, `Rf_!` or `f^!` on the derived categories of étale
  sheaves of modules.
* Constructible finiteness and `Dᵇ_ctf` preservation (§F.3) and the perverse `t`-structures
  (§F.8): no constructible étale sheaves and no bounded constructible derived category.
* The monodromy equivalence for finite lisse sheaves (§F.0.2): no locally constant sheaves of
  modules on the small étale site, and the equivalence is data.
* The tame character of a henselian trait (§F.3a): Tau Ceti's tame character
  `TauCeti.inertiaTameCharacter` is defined for nonarchimedean local fields only, and the pins
  have no tame character and no wild inertia subgroup for a general henselian discrete valuation
  ring. The inertia sequence of a trait is not a headline: its surjectivity is Mathlib's
  `Ideal.Quotient.stabilizerHom_surjective_of_profinite` for the integral closure of the trait in
  a separable closure of its fraction field, whose maximal ideal the whole Galois group
  stabilizes because the trait is henselian.
* Finite generation of `ℓ`-adic cohomology over `ℤ_ℓ` (§F.4.4) and the Frobenius modules of
  §F.10.2b: Mathlib's `Scheme.EllAdicCohomology` carries no `ℤ_[ℓ]`-module structure, and there is
  no Frobenius action on it.
* The Gauss–Bonnet formula (§F.6): no Chern classes of vector bundles in étale cohomology.
-/

noncomputable section

@[expose] public section

namespace TauCetiRoadmap.EtaleCohomologyFoundations

open CategoryTheory AlgebraicGeometry Limits

universe u

/-! ## G.2 Nagata compactification over a qcqs base -/

/-- **Nagata compactification** (Stacks, Theorem 38.33.8, tag 0F41). A separated morphism of
finite type `f : X ⟶ S` to a quasi-compact quasi-separated scheme `S` has a compactification:
a factorization `f = j ≫ p` through a quasi-compact open immersion `j` and a proper morphism
`p`, an object of Tau Ceti's `TauCeti.Compactification f`. Tau Ceti then makes the dense
compactifications of `f` a cofiltered category. -/
theorem nagataCompactification {X S : Scheme.{u}} [CompactSpace S] [QuasiSeparatedSpace S]
    (f : X ⟶ S) [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f] :
    Nonempty (TauCeti.Compactification f) := by
  sorry

/-! ## F.0.2 The étale fundamental group -/

/-- **The étale fundamental group** `π₁(S, x)` of a scheme `S` at a geometric point
`x : Spec Ω ⟶ S`, `Ω` separably closed: the automorphism group of Tau Ceti's geometric fibre
functor `TauCeti.FiniteEtaleScheme.fiber x` on finite étale `S`-schemes (SGA 1, Exposé V, §7).
No connectedness of `S` is assumed; for the spectrum of a field it is the absolute Galois group
(`TauCeti.FiniteEtaleScheme.galContinuousMulEquivAutFiber`). -/
abbrev EtaleFundamentalGroup {S : Scheme.{u}} {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (x : Spec (.of Ω) ⟶ S) :=
  Aut (TauCeti.FiniteEtaleScheme.fiber x)

/-- **Functoriality of `π₁`.** A morphism `f : T ⟶ S` and a geometric point `x` of `T` induce
`π₁(T, x) → π₁(S, x ≫ f)`: an automorphism of the fibre functor at `x` is whiskered by base change
of finite étale covers along `f` and transported along Tau Ceti's identification
`TauCeti.FiniteEtaleScheme.pullbackCompFiberIso` of the fibre at `x` of a base change with the
fibre at `x ≫ f` (SGA 1, Exposé V, §7). -/
def EtaleFundamentalGroup.map {T S : Scheme.{u}} (f : T ⟶ S) {Ω : Type u} [Field Ω]
    [IsSepClosed Ω] (x : Spec (.of Ω) ⟶ T) :
    EtaleFundamentalGroup x →* EtaleFundamentalGroup (x ≫ f) where
  toFun σ := .of ((TauCeti.FiniteEtaleScheme.pullbackCompFiberIso f x).symm ≪≫
    Functor.isoWhiskerLeft (TauCeti.FiniteEtaleScheme.pullback f) σ.asIso ≪≫
      TauCeti.FiniteEtaleScheme.pullbackCompFiberIso f x)
  map_one' := by
    apply Aut.ext
    ext X y
    simp
  map_mul' σ τ := by
    apply Aut.ext
    ext X y
    simp

/-! ## F.0.A2 The arithmetic fundamental-group sequence -/

/-- **The arithmetic fundamental-group exact sequence** (SGA 1, Exposé IX, Théorème 6.1,
p. 195). Let `X` be a quasi-compact scheme over a field `k` that is geometrically connected, that
is `X_k̄ = X ×_k k̄` is connected for an algebraic closure `k̄` of `k`, and let `x` be a geometric
point of `X_k̄`. The maps on étale fundamental groups induced by the projection `X_k̄ → X` and by
the structure morphism `X → Spec k` form an exact sequence
`1 → π₁(X_k̄, x) → π₁(X, x) → π₁(Spec k, x) → 1`. -/
theorem arithmeticExactSequence {k : Type u} [Field k] (kbar : Type u) [Field kbar]
    [Algebra k kbar] [IsAlgClosure k kbar] {X : Scheme.{u}} (p : X ⟶ Spec (.of k))
    [CompactSpace X]
    [ConnectedSpace ↥(pullback p (Spec.map (CommRingCat.ofHom (algebraMap k kbar))))]
    {Ω : Type u} [Field Ω] [IsSepClosed Ω]
    (x : Spec (.of Ω) ⟶ pullback p (Spec.map (CommRingCat.ofHom (algebraMap k kbar)))) :
    Function.Injective (EtaleFundamentalGroup.map (pullback.fst _ _) x) ∧
      Function.Surjective (EtaleFundamentalGroup.map p (x ≫ pullback.fst _ _)) ∧
      (EtaleFundamentalGroup.map (pullback.fst _ _) x).range =
        (EtaleFundamentalGroup.map p (x ≫ pullback.fst _ _)).ker := by
  sorry

/-! ## F.3.0 Geometric étale dimension bound -/

/-- **Étale cohomological dimension** (SGA 4, Exposé X). Let `X` be a scheme of finite type over a
separably closed field `k` and `F` a torsion abelian sheaf on its small étale site whose torsion
orders are invertible in `k`: every section over a quasi-compact étale `U → X` is killed by an
integer invertible in `k`. Then `Hᵠ(X, F) = 0` for `q > 2 dim X`. -/
theorem VanishingCycles.etaleCohomologicalDimension {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) [LocallyOfFiniteType f] [QuasiCompact f]
    (F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u})
    (hF : ∀ U : X.Etaleᵒᵖ, CompactSpace U.unop.left →
      ∀ s : F.obj.obj U, ∃ n : ℕ, (n : k) ≠ 0 ∧ n • s = 0)
    (q : ℕ) (hq : 2 * topologicalKrullDim X < q) :
    Subsingleton (F.H q) := by
  sorry

/-! ## F.3 Finiteness, Artin vanishing and generic acyclicity -/

/-- **Artin vanishing** (Stacks, Proposition 59.95.6, tag 0F0V; SGA 4, Exposé XIV). Let `X` be an
affine scheme of finite type over a separably closed field `k` and `F` a torsion abelian sheaf on
its small étale site: every section over a quasi-compact étale `U → X` is killed by a positive
integer. Then `Hᵠ(X, F) = 0` for `q > dim X`. No condition on the torsion orders is needed. -/
theorem VanishingCycles.affineArtinVanishing {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} [IsAffine X] (f : X ⟶ Spec (.of k)) [LocallyOfFiniteType f]
    (F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u})
    (hF : ∀ U : X.Etaleᵒᵖ, CompactSpace U.unop.left →
      ∀ s : F.obj.obj U, ∃ n : ℕ, n ≠ 0 ∧ n • s = 0)
    (q : ℕ) (hq : topologicalKrullDim X < q) :
    Subsingleton (F.H q) := by
  sorry

/-- **Finiteness of étale cohomology** (SGA 4½, [Th. finitude]; SGA 4, Exposé XIV for proper `X`).
Let `X` be a scheme of finite type over a separably closed field `k` and `M` a finite abelian group
whose order is invertible in `k`. Then every étale cohomology group `Hⁱ(X, M)` of the constant
sheaf `M` is finite. -/
theorem VanishingCycles.finite_H_constantSheaf {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) [LocallyOfFiniteType f] [QuasiCompact f]
    (M : AddCommGrpCat.{u}) [Finite M] (hM : (Nat.card M : k) ≠ 0) (i : ℕ) :
    Finite (((constantSheaf X.smallEtaleTopology AddCommGrpCat.{u}).obj M).H i) := by
  sorry

/-! ## F.4.4 Integral finiteness, perfectness and derived reduction -/

/-- **Vanishing of `ℓ`-adic cohomology above twice the dimension.** Let `X` be a scheme of finite
type over a separably closed field `k` and `ℓ` a prime invertible in `k`. Mathlib's pro-étale
`ℓ`-adic cohomology `Hᵠ(X_proét, ℤ_ℓ)` vanishes for `q > 2 dim X`. It is the cohomology of the
derived limit of the complexes `RΓ(X, ℤ/ℓⁿ)` (Bhatt–Scholze, Proposition 5.6.2); these vanish
above degree `2 dim X` (`VanishingCycles.etaleCohomologicalDimension`) and have finite cohomology
(`VanishingCycles.finite_H_constantSheaf`), so no `lim¹` term survives. -/
theorem VanishingCycles.subsingleton_ellAdicCohomology {k : Type u} [Field k] [IsSepClosed k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) [LocallyOfFiniteType f] [QuasiCompact f]
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : k) ≠ 0) (q : ℕ) (hq : 2 * topologicalKrullDim X < q) :
    Subsingleton (X.EllAdicCohomology ℓ q) := by
  sorry

end TauCetiRoadmap.EtaleCohomologyFoundations
