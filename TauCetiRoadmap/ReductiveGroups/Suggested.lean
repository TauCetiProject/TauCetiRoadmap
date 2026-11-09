import Mathlib
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.Form
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.Topology.Algebra.PointTopology.Scheme

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, each admitted with `sorry`: compactness of the complex points
of a proper complex scheme in the chart topology (Layer 3A); Nagata's characteristic-`p`
criterion that a smooth geometrically connected affine group is linearly reductive exactly when
it is a torus (Layer 6); the characteristic-zero Levi complement of §6A in Hopf coordinates;
conjugacy of maximal tori by rational points over an algebraically closed field, and the Levi
decomposition of a parabolic subgroup of a reductive group over an arbitrary field in the same
Hopf coordinates (Layer 7); Lang surjectivity over finite fields (Layer 7a); integral PBW for
the full reductive Chevalley frame, including its central torus (Layer 9A); and nonsplitting of
the braid permutation extension for at least two strands (Layer 11).

Proved in the pinned Tau Ceti, hence consumed and not restated:
* §§3A.2–3A.4, the orbit theorems for a finite-type group acting on a finite-type scheme over an
  algebraically closed field, with no smoothness or separatedness hypothesis:
  `TauCeti.SchemeAction.isLocallyClosed_orbit` and
  `TauCeti.SchemeAction.topologicalKrullDim_orbitBoundary_lt`
  (`TauCeti/AlgebraicGeometry/GroupAction/LocallyClosed.lean`),
  `TauCeti.SchemeAction.exists_isClosed_orbit_subset_orbitClosure` and
  `TauCeti.SchemeAction.exists_isClosed_orbit`
  (`TauCeti/AlgebraicGeometry/GroupAction/ClosedOrbit.lean`).
* §3A.5's classical topology on scheme points, `TauCeti.SchemePointTopology.topology`, on which
  the compactness theorem below is stated.
* §6.2's characteristic-zero equivalence of reductivity and linear reductivity for geometrically
  connected groups, `TauCeti.reductiveCommHopfAlgProperty_iff_linearlyReductive`
  (`TauCeti/Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean`).
* §6B's identification of the homogeneous quotient by a linearly reductive subgroup with the
  spectrum of the invariants, `TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints`,
  and its characteristic-zero form for reductive subgroups,
  `TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`
  (`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Coinvariants.lean`).
* §7.1's conjugacy of Borel subgroups over an algebraically closed field,
  `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`
  (`TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`).
* §9A.1a-L's lifts of lattice isometries to the ordered sign cover: the cover is `Matrix.SignCover`,
  every Gram isometry lifts by `Matrix.SignCover.map`, and a lift over the identity that fixes the
  central signs is determined by its section signs, which form a character of the lattice
  (`Matrix.SignCover.eq_id_of_sectionSign_eq_one`).

Not statable at the pins, hence not stated, with the missing carrier named:
* The full smooth-chart comparison of §3A.5 lacks a manifold atlas on native scheme points; it is a
  construction of README §3A.5.
* The general pinned integral model of Layer 9 and its change-of-choice theorem lack the root
  datum of a pinned split reductive group scheme as a root pairing: the pinned `TauCeti.Pinning`
  indexes its root vectors by simple roots read off from the group, and root data are extracted
  only for specific matrix groups.
* The relative structure theorems of §8.2 lack the center of an affine group scheme over a base
  ring: the pinned center, `TauCeti.CommHopfAlgCat.centerDefiningIdeal`, is constructed over a
  field.
* The highest-weight classification lacks the rational highest-weight modules of a split reductive
  group and their identification with the prescribed integral model.
* The spectral monodromy theorem lacks the constructed regular-semisimple quotient and its
  analytic comparison on native group points.
* The Harish–Chandra biadjunctions, Mackey decomposition and common-Levi independence of
  §§7c–7e, including their Steinberg-endomorphism extensions in §7g, lack the Harish–Chandra
  induction and restriction functors between representations of the finite groups of rational
  points of a Frobenius-stable parabolic subgroup and its Levi complement.
* The distribution comparison, Frobenius-kernel and contraction theorems of §9C lack the algebra
  of identity-supported distributions of the constructed integral group, its relative Frobenius
  map and the rational contracted-module construction.
* The Weyl/simple-module and Steinberg-module endpoints of §10 lack their rational highest-weight
  module constructions.

The semidirect-product form `U ⋊ L ≃ G` of §6A is the Hopf-coordinate statement below, read as an
isomorphism of the Levi complement with the reductive quotient; it is not restated separately.
-/

open CategoryTheory AlgebraicGeometry

namespace TauCetiRoadmap.ReductiveGroups

universe u

/-! ## Layer 3A: proper complex points -/

namespace ClassicalPoints

/-- A scheme proper over `ℂ` has compact complex points: the morphisms `Spec ℂ → X` over `Spec ℂ`,
with the chart topology `TauCeti.SchemePointTopology.topology`, the final topology for the
coordinate-evaluation topologies of all affine open charts, form a compact space (SGA 1 XII,
Proposition 3.2(v)). Properness is needed: the points of `𝔸¹` are `ℂ`, which is not compact. The
empty scheme is proper and has no points. -/
theorem compact_complexPoints {X : Scheme.{0}} (f : X ⟶ Spec (.of ℂ)) [IsProper f] :
    @CompactSpace (TauCeti.SchemePointTopology.Points (R := ℂ) f)
      (TauCeti.SchemePointTopology.topology f) := by
  sorry

end ClassicalPoints

/-! ## Layer 6: linear reductivity in characteristic `p` -/

/-- Nagata's theorem. Over a field of characteristic `p > 0`, a smooth geometrically
connected affine group of finite type is linearly reductive if and only if it is a torus,
where a torus means a group that becomes a split torus over an algebraic closure
(Milne 2017, Remark 12.56, p. 249, with the footnote to Proposition 12.54, p. 248: linear
reductivity is insensitive to extension of the base field). Smoothness is needed: `μ_p` is
connected and linearly reductive but not a torus. Geometric connectedness is needed: the
constant group `ℤ/ℓ` for a prime `ℓ ≠ p` is linearly reductive and not a torus. -/
theorem linearlyReductive_iff_torus (k : Type u) [Field k]
    (p : ℕ) [Fact p.Prime] [CharP k p]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    TauCeti.linearlyReductiveCommHopfAlgProperty k H.obj ↔
      TauCeti.torusCommHopfAlgProperty k H := by
  sorry

/-! ## Layer 6A: characteristic-zero Levi complements -/

namespace LeviComplements

/-- Mostow's theorem in Hopf coordinates. Over a field `k` of characteristic zero, a smooth
geometrically connected affine group `G` of finite type has a Levi complement: a closed
subgroup `L` on which the quotient map `q : G → Q = G/R_u(G)` restricts to an isomorphism.
With `I_u` the defining Hopf ideal of the `k`-unipotent radical (the geometric unipotent
radical, since `k` is perfect), `O(Q)` is the subalgebra of right `I_u`-coinvariants of `O(G)`,
and `L` is cut out by a Hopf ideal `J` for which the composite `O(Q) → O(G) → O(G)/J = O(L)`
is bijective (McNinch, Levi decompositions of a linear algebraic group, §3.1, p. 6). For
reductive `G` the ideal `J = 0` works; for unipotent `G` the augmentation ideal works. The
characteristic hypothesis is needed: in characteristic `p` the group of length-two Witt
vector points of `SL₂` has reductive quotient `SL₂` and no Levi complement (McNinch, (3.2.1),
p. 7). -/
theorem exists_levi_complement (k : Type u) [Field k] [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj) :
    ∃ J : TauCeti.HopfIdeal k H,
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal H).coinvariants.val) := by
  sorry

end LeviComplements

/-! ## Layer 7: maximal tori and parabolic subgroups -/

namespace BorelTori

/-- Over an algebraically closed field `k`, any two maximal tori of a finite-type affine group
`G` are conjugate by a rational point: if the Hopf ideals `I` and `J` cut out maximal tori `T`
and `T'`, then `g T g⁻¹ = T'` for some `g ∈ G(k)`, that is `I.conjugate g = J` (Milne 2017,
Theorem 17.10, p. 354, for smooth connected `G`; the tori of `G` are the tori of the smooth
connected subgroup `(G_red)°`, whose rational points are rational points of `G`). The pinned
`TauCeti.HopfIdeal.exists_conjugate_eq_of_isMaximalTorus` assumes in addition that both tori
can be conjugated into a fixed maximal torus. Algebraic closedness is needed: over `ℝ` the
diagonal torus and `SO₂` are maximal tori of `SL₂` that no real point conjugates into each
other. -/
theorem exists_conjugate_eq_of_isMaximalTorus (k : Type u) [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) {I J : TauCeti.HopfIdeal k H.obj}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H.obj →ₐ[k] k), I.conjugate g = J := by
  sorry

end BorelTori

namespace Parabolics

/-- Levi decomposition of a parabolic subgroup over an arbitrary field. Let `G` be a reductive
group over a field `k` (smooth, geometrically connected, with trivial geometric unipotent
radical) and `P = V(I)` a parabolic `k`-subgroup in the sense of `TauCeti.HopfIdeal.IsParabolic`:
`P` is smooth and its base change to an algebraic closure contains a Borel subgroup. Then the
`k`-unipotent radical `U` of `P` has a Levi `k`-subgroup `L ⊆ P` mapping isomorphically onto
`P/U`. In Hopf coordinates, as in §6A: with `I_u` the defining Hopf ideal of `U` in `O(P)`,
`O(P/U)` is the subalgebra of right `I_u`-coinvariants of `O(P)`, and `L` is cut out by a Hopf
ideal `J` of `O(P)` for which the composite `O(P/U) → O(P) → O(P)/J = O(L)` is bijective
(Conrad–Feng, *Reductive Groups over Fields*, Theorem 6.1.1, p. 46, which writes `P = P_G(λ)`
for a `k`-cocharacter `λ`, and the end of §6.3, p. 58, where `U = U_G(λ)` and `L = Z_G(λ)`). No
characteristic hypothesis is needed, unlike §6A. Reductivity is needed: in characteristic `p` the
group of length-two Witt vector points of `SL₂` is parabolic in itself and has no Levi
complement (McNinch, (3.2.1), p. 7). For `P = G` the ideal `J = 0` works; for the upper Borel of
`SL₂`, `L` is the diagonal torus. -/
theorem exists_levi_complement_of_isParabolic (k : Type u) [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hG : TauCeti.reductiveCommHopfAlgProperty k H)
    {I : TauCeti.HopfIdeal k H.obj} (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry

end Parabolics

/-! ## Layer 7a: Lang surjectivity over finite fields -/

namespace FiniteFieldPoints

/-- Lang's theorem. For a smooth geometrically connected affine group `G` of finite type over
a finite field `k` with `q` elements, and an algebraically closed extension `K` of `k`, every
`K`-point of `G` is `g⁻¹ F(g)` for some `K`-point `g`, where `F(g)` is `g` followed by the
`q`-power Frobenius of `K` (Milne 2017, Theorem 17.96 and Corollary 17.97, p. 383; the source
writes the map as `g ↦ g F(g)⁻¹`, and inverting the input converts one convention into the
other). Geometric connectedness is needed: on the constant group `ℤ/2` the map is constant
with value `1`. Algebraic closedness of `K` is needed: on `𝔾_a` over `K = k` the map
`x ↦ x^q − x` is zero. -/
theorem lang_surjective (k : Type u) [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hsmooth : Algebra.Smooth k H)
    (hconnected : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    (K : Type u) [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective (fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * WithConv.toConv (F.comp g.ofConv)) := by
  sorry

end FiniteFieldPoints

/-! ## Layer 9A: the full reductive integral enveloping form -/

namespace IntegralPBW
noncomputable section
variable {m r : ℕ} {X Y L : Type*}
variable [AddCommGroup X] [AddCommGroup Y]
variable [LieRing L] [LieAlgebra ℚ L]
variable (P : RootPairing (Fin m) ℤ X Y) [P.IsCrystallographic]

/-- A concrete rational realization of the full integral reductive datum.
Every field is actual data or a specified equation, not an unspecified Prop.
Finite roots and toral bases are enumerated; arbitrary finite orders transport
by reindexing. Empty root sets and rank-zero cases are included. -/
structure ReductiveChevalleyFrame where
  reduced : P.IsReduced
  toralBasis : Module.Basis (Fin r) ℤ Y
  cartan : Y →ₗ[ℤ] L
  rootVector : Fin m → L
  ambientBasis : Module.Basis (Fin r ⊕ Fin m) ℚ L
  basis_toral (j : Fin r) : ambientBasis (Sum.inl j) = cartan (toralBasis j)
  basis_root (i : Fin m) : ambientBasis (Sum.inr i) = rootVector i
  toral_commute (y z : Y) : ⁅cartan y, cartan z⁆ = 0
  toral_root (y : Y) (i : Fin m) :
    ⁅cartan y, rootVector i⁆ = ((P.toLinearMap (P.root i) y : ℤ) : ℚ) • rootVector i
  opposite_root (i j : Fin m) (hij : P.root j = -P.root i) :
    ⁅rootVector i, rootVector j⁆ = cartan (P.coroot i)
  rootConstant : Fin m → Fin m → ℤ
  root_sum (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = (rootConstant i j : ℚ) • rootVector k
  root_constant_size (i j k : Fin m) (hijk : P.root k = P.root i + P.root j) :
    Int.natAbs (rootConstant i j) = P.chainBotCoeff i j + 1
  root_zero (i j : Fin m) (hne : P.root i + P.root j ≠ 0)
      (hnot : ∀ k : Fin m, P.root k ≠ P.root i + P.root j) :
    ⁅rootVector i, rootVector j⁆ = 0

variable {P}

/-- Native integral subring, using every root and the full Y basis. -/
def integralSubring (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    Subring (UniversalEnvelopingAlgebra ℚ L) :=
  TauCeti.UniversalEnvelopingAlgebra.kostantForm D.rootVector
    (fun j => D.cartan (D.toralBasis j))

/-- The integral enveloping form as the carrier of its native Kostant subring. -/
abbrev IntegralForm (D : ReductiveChevalleyFrame (r := r) (L := L) P) :=
  ↥(integralSubring D)

/-- Actual native divided-power value and its native membership proof. -/
def rootDividedPower (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (i : Fin m) (a : ℕ) : IntegralForm D :=
  ⟨TauCeti.Associative.dividedPower a (UniversalEnvelopingAlgebra.ι ℚ (D.rootVector i)),
    TauCeti.UniversalEnvelopingAlgebra.dividedPower_mem_kostantForm _ _ i a⟩

attribute [local instance] TauCeti.moduleNNRat

/-- Full toral binomial, including central cocharacters. -/
def toralBinomial (D : ReductiveChevalleyFrame (r := r) (L := L) P)
    (j : Fin r) (a : ℕ) : IntegralForm D :=
  ⟨Ring.choose (UniversalEnvelopingAlgebra.ι ℚ (D.cartan (D.toralBasis j))) a,
    TauCeti.UniversalEnvelopingAlgebra.ringChoose_mem_kostantForm _ _ j a⟩

/-- Finite multi-exponents for negative roots, every toral direction, positive roots. -/
abbrev PBWExponent (base : P.Base) :=
  ({i : Fin m // ¬base.IsPos i} → ℕ) × (Fin r → ℕ) ×
    ({i : Fin m // base.IsPos i} → ℕ)

/-- The ordered product itself, not an arbitrary admitted label for a monomial. -/
def orderedIntegralMonomial (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    PBWExponent (r := r) base → IntegralForm D := by
  classical
  intro a
  let neg := ((Finset.univ : Finset {i : Fin m // ¬base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.1 i))
  let tor := ((Finset.univ : Finset (Fin r)).sort (· ≤ ·)).map
    (fun j => toralBinomial D j (a.2.1 j))
  let pos := ((Finset.univ : Finset {i : Fin m // base.IsPos i}).sort (· ≤ ·)).map
    (fun i => rootDividedPower D i.1 (a.2.2 i))
  exact neg.prod * tor.prod * pos.prod

/-- The ordered negative-root, full-torus and positive-root monomials form a
ℤ-basis of the integral enveloping form, including root-free and rank-zero data. -/
theorem integral_pbw (base : P.Base)
    (D : ReductiveChevalleyFrame (r := r) (L := L) P) :
    LinearIndependent ℤ (orderedIntegralMonomial base D) ∧
      Submodule.span ℤ (Set.range (orderedIntegralMonomial base D)) = ⊤ := by
  sorry

end
end IntegralPBW

/-! ## Layer 11: braid permutation monodromy -/

namespace BraidMonodromy

/-- The permutation map from braids on at least two strands admits no group-homomorphic
section; the exponent sum of an involution is zero, whereas a transposition has odd parity. -/
theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end BraidMonodromy
end TauCetiRoadmap.ReductiveGroups
