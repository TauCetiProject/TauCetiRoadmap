module

public import Mathlib
public import TauCeti.AlgebraicGeometry.Compactification.Basic
public import TauCeti.AlgebraicGeometry.RationalPoint.Count

/-!
# Étale cohomology foundations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries can express, each
with `sorry`, and only the definitions those statements need.

Stated here:

* `nagataCompactification` (§G.2): every separated finite-type morphism to a quasi-compact
  quasi-separated scheme has a compactification, on Tau Ceti's carrier
  `TauCeti.Compactification`.
* `VanishingCycles.etaleCohomologicalDimension` (§F.3.0): étale cohomology of a finite-type
  scheme over a separably closed field with prime-to-characteristic torsion coefficients vanishes
  above twice the dimension.
* `VanishingCycles.affineArtinVanishing` (§F.3): on an affine finite-type scheme it vanishes above
  the dimension.
* `VanishingCycles.finite_H_constantSheaf` (§F.3): finiteness of the cohomology of a finite-type
  scheme over a separably closed field with finite constant coefficients of invertible order.
* `VanishingCycles.subsingleton_ellAdicCohomology` (§F.4.4): Mathlib's pro-étale `ℓ`-adic
  cohomology vanishes above twice the dimension.
* `Scheme.Hom.pointCount_eq_numberOfRationalPoints` and `VanishingCycles.frobeniusFixedPoints`
  (§F.10.1): point counts over finite extensions of a finite field, on Tau Ceti's
  `Scheme.Hom.numberOfRationalPoints`, and their computation by fixed points of Frobenius.

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
* The arithmetic fundamental-group exact sequence (§F.0.A2): no map between automorphism groups
  of Tau Ceti's fibre functors `TauCeti.FiniteEtaleScheme.fiber` induced by a morphism of schemes.
* The henselian-trait inertia sequence and the tame character (§F.3a): no specialization map from
  the absolute Galois group of the fraction field of a henselian discrete valuation ring to that
  of its residue field.
* Finite generation of `ℓ`-adic cohomology over `ℤ_ℓ` (§F.4.4) and the Frobenius modules of
  §F.10.2b: Mathlib's `Scheme.EllAdicCohomology` carries no `ℤ_[ℓ]`-module structure, and there is
  no Frobenius action on it.
* The Gauss–Bonnet formula (§F.6): no Chern classes of vector bundles in étale cohomology.
-/

noncomputable section

@[expose] public section

namespace TauCetiRoadmap.EtaleCohomologyFoundations

open CategoryTheory AlgebraicGeometry

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

/-! ## F.10.1 Finite-field descent and rational-point fixed points -/

/-- **Arithmetic Frobenius.** Mathlib's `FiniteField.frobeniusAlgEquivOfAlgebraic`, the
`k`-automorphism `x ↦ x ^ Nat.card k` of an algebraic extension `L` of the finite field `k`. The
`Fintype` structure it uses is internal to the definition and does not change its value. -/
noncomputable def VanishingCycles.arithmeticFrobenius (k L : Type u) [Field k] [Finite k]
    [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] : L ≃ₐ[k] L :=
  letI := Fintype.ofFinite k
  FiniteField.frobeniusAlgEquivOfAlgebraic k L

/-- **Finiteness of rational points.** A scheme of finite type over a finite field `k` has only
finitely many points with values in a finite extension field `L` of `k`. -/
theorem VanishingCycles.rationalPoints_finite (k L : Type u) [Field k] [Finite k]
    [Field L] [Finite L] [Algebra k L]
    (X : Scheme.{u}) (a : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType a] [QuasiCompact a] :
    Finite {x : Spec (CommRingCat.of L) ⟶ X //
      x ≫ a = Spec.map (CommRingCat.ofHom (algebraMap k L))} := by
  sorry

/-- **Point counts over finite extensions.** For `f : X ⟶ Spec k` with `k` finite of cardinality
`q`, the number of points of `X` with values in the degree-`r` extension of `k`, modelled as the
splitting field of `X ^ (q ^ r) - X` over `k`: Tau Ceti's `Scheme.Hom.numberOfRationalPoints` of
that field. -/
noncomputable def Scheme.Hom.pointCount {k : Type u} [Field k] [Finite k] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of k)) (r : ℕ) : ℕ :=
  f.numberOfRationalPoints
    (Polynomial.SplittingField (Polynomial.X ^ Nat.card k ^ r - Polynomial.X : Polynomial k))

/-- **Independence of the model of the extension.** For every finite extension `E` of the finite
field `k`, `Scheme.Hom.pointCount f [E : k]` is the number of `E`-points of `X` over `k`. -/
theorem Scheme.Hom.pointCount_eq_numberOfRationalPoints {k : Type u} [Field k] [Finite k]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) (E : Type u) [Field E] [Algebra k E]
    [Module.Finite k E] :
    Scheme.Hom.pointCount f (Module.finrank k E) = f.numberOfRationalPoints E := by
  sorry

/-- **Points as Frobenius fixed points.** For `r > 0` and an algebraic closure `L` of the finite
field `k`, the points of `X` over the degree-`r` extension of `k` are counted by the `L`-points of
`X` over `k` fixed by the `r`-th power of arithmetic Frobenius. The underlying bijection is Tau
Ceti's `AlgEquiv.fromSpecFixedFieldEquiv`; no finiteness hypothesis on `X` is needed. -/
theorem VanishingCycles.frobeniusFixedPoints {k : Type u} [Field k] [Finite k]
    (L : Type u) [Field L] [Algebra k L] [Algebra.IsAlgebraic k L] [IsAlgClosed L]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of k)) (r : ℕ) (hr : 0 < r) :
    Scheme.Hom.pointCount f r =
      Nat.card {x : Spec (.of L) ⟶ X //
        x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap k L)) ∧
        Spec.map (CommRingCat.ofHom
          (VanishingCycles.arithmeticFrobenius k L ^ r).toRingHom) ≫ x = x} := by
  sorry

end TauCetiRoadmap.EtaleCohomologyFoundations
