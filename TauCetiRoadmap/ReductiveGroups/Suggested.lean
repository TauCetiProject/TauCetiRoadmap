import Mathlib
import TauCeti.Algebra.AlgebraicGroup.LinearlyReductive
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Coinvariants.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.IdentityComponent
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Radical.Construction
import TauCeti.Algebra.AlgebraicGroup.Fppf.Quotient.Homogeneous.Coinvariants
import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic
import TauCeti.AlgebraicGeometry.GroupAction.Orbit.Basic
import TauCeti.Topology.Algebra.PointTopology.Scheme
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.Form
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.GroupTheory.Coxeter.Artin
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix

/-!
# Reductive algebraic groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: local closedness of the orbits of a finite-type group over any field
and compactness of proper complex scheme points (Layer 3A); Nagata's characteristic-`p`
criterion that a smooth connected affine group is linearly reductive exactly when it is a torus
(Layer 6); the characteristic-zero Levi complement of §6A in Hopf coordinates; affineness of the
quotient of an affine group by a closed subgroup with reductive identity component (§6B);
conjugacy of maximal tori by rational points over an algebraically closed field (§7.1); Levi
complements of parabolic subgroups of reductive groups over any field (§7.2); Lang surjectivity
over finite fields (Layer 7a);
integral PBW for the full reductive Chevalley frame, including its central torus (Layer 9A);
Artin's identification of the fundamental group of the unordered configuration space of the
plane with the braid group, and nonsplitting of the braid permutation extension for at least two
strands (§11A); and Brieskorn's identification of the fundamental group of the regular orbit
space of a finite Weyl arrangement with the Artin group of its Coxeter matrix (§11B).

The pinned Tau Ceti proves four headline theorems of the README, which are therefore cited
there and not stated here: the strict dimension drop at the boundary of an orbit and the closed
orbit in every orbit closure over an algebraically closed field (§§3A.3–3A.4), the
characteristic-zero equivalence of reductivity and complete reducibility (§6.2), and conjugacy
of Borel subgroups by a rational point (§7.1).

The signed ADE integral Lie construction and its full-lattice comparison lack the
constructed signed root-space Lie algebra and its Chevalley-frame identification. The
lift theorem of §9A.1a-L, that every shell-preserving Gram isometry of the root lattice `Q`
lifts to the signed cover with kernel `Hom(Q, {±1})`, lacks that signed cover: the central
extension of `Q` by `ℤˣ` whose factor set is the sign of the ordered Gram form, which neither
Mathlib nor Tau Ceti provides and which §9A.1a constructs.
The pinned fixed-Lie folding classification lacks that Lie algebra with its pinned
diagram action, integral fixed lattice and normalized folded root datum. Native
fixed-subalgebra and Serre-presentation carriers alone do not identify these objects.
The general pinned integral model and its change-of-choice theorem lack the root datum of a
pinned split reductive group scheme as a root pairing: the pinned `TauCeti.Pinning` indexes its
root vectors by simple roots read off from the group, and root data are extracted only for
specific matrix groups.
The relative structure theorems of §8.2 lack the center of an affine group scheme over a base
ring: the pinned center, `TauCeti.CommHopfAlgCat.centerDefiningIdeal`, is constructed over a
field. The
highest-weight classification lacks the rational highest-weight modules and their
identification with the prescribed integral model. The spectral monodromy theorem
lacks the constructed regular-semisimple quotient and its analytic comparison on
the native group-point carrier. The full smooth-chart comparison lacks the compatible manifold atlas on native
scheme points; this is a construction of README §3A.5. The semidirect-product forms
`U ⋊ L ≃ G` of the Levi decompositions of §6A and §7.2 are the Hopf-coordinate statements
below, read as isomorphisms of the Levi complement with the reductive quotient; they are not
restated separately. The Bruhat decomposition
`B(k)\G(k)/B(k) ≃ W` of §7.3 lacks the root subgroups and the Weyl group `N_G(T)/T` of a given
split group with its root datum: the pinned root subgroups, Weyl groups and Bruhat decompositions
belong to specific carriers (`GL_n`, `SL_n`, `Sp_2n`, and the Chevalley-type group schemes built
from Kostant forms, such as the Geck and E₆ minuscule carriers) and to an abstract Tits system,
none of them attached to an arbitrary split group with its root datum.
The Harish–Chandra biadjunctions, Mackey
decomposition and common-Levi independence of §§7c–7e, including their Steinberg
endomorphism extensions in §7g, lack the constructed
Frobenius-fixed parabolic and Levi groups with their Harish–Chandra functors.
The distribution comparison, Frobenius-kernel and contraction theorems of §9C
lack the algebra of identity-supported distributions of the constructed integral
group, its relative Frobenius map and the rational contracted-module construction.
The Weyl/simple-module and Steinberg-module endpoints of §10 lack their
rational highest-weight module constructions as well.
The generator-characterized forms of the Artin and Brieskorn isomorphisms of §§11A–11B, which
send the half-twist loops and the wall-crossing loops to the standard generators, lack those
loops: they are the based constructions of §§11A–11B, and only the isomorphism type is
stated here.
These endpoints remain in
the README; no surrogate constructor or arbitrary maps are assumed here.
-/

open CategoryTheory MonoidalCategory CartesianMonoidalCategory AlgebraicGeometry
open scoped CategoryTheory.MonObj
open Topology

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace TauCetiRoadmap.ReductiveGroups

/-! ## Layer 3A: algebraic orbits -/

namespace AlgebraicOrbits
universe u

/-- Over any field `k`, the orbit of a rational point under an algebraic action of a group scheme
of finite type over `k` on a scheme of finite type over `k` is locally closed. The orbit is the
pinned `TauCeti.SchemeAction.orbit`, the image of the orbit morphism on underlying spaces.
Neither smoothness nor affineness of the group, separatedness of the scheme nor algebraic
closedness of `k` is needed (Milne 2017, Proposition 1.65(b), pp. 26–27, applied to the orbit
map, which is equivariant for left translation, as in the definition of orbits that follows it on
p. 27). The pinned `TauCeti.SchemeAction.isLocallyClosed_orbit` is the case of an algebraically
closed `k`. Quasi-compactness of the group is needed: the constant group `ℤ` translating the
affine line over `ℚ` has the integers as the orbit of `0`, which is dense and not open in the
line. Over `ℝ`, `μ₃` scaling the affine line has at `1` the closed two-point orbit
`{(t − 1), (t² + t + 1)}`, although `μ₃` has one real point. -/
theorem orbit_locallyClosed {k : Type u} [Field k] (G X : Over (Spec (CommRingCat.of k)))
    [GrpObj G] [ModObj G X]
    [hGroupFiniteType : LocallyOfFiniteType G.hom] [hGroupQC : QuasiCompact G.hom]
    [hXFiniteType : LocallyOfFiniteType X.hom] [hXQC : QuasiCompact X.hom]
    (x : 𝟙_ (Over (Spec (CommRingCat.of k))) ⟶ X) :
    IsLocallyClosed (TauCeti.SchemeAction.orbit G x) := by sorry

end AlgebraicOrbits

/-! ## Layer 3A: proper complex points -/

namespace ClassicalPoints

/-- A proper complex scheme has compact classical points (SGA 1 XII, Proposition 3.2(v)). The
points are the pinned `TauCeti.SchemePointTopology.Points`, the morphisms `Spec ℂ ⟶ X` over
`Spec ℂ`, with the pinned chart topology `TauCeti.SchemePointTopology.topology`, the finest
topology making every affine open chart continuous. For the projective line the two charts `ℂ`
glue to the sphere; for the affine line, which is not proper, the points are `ℂ`. -/
theorem compact_complexPoints (X : Over (Spec (CommRingCat.of ℂ))) [IsProper X.hom] :
    @CompactSpace (TauCeti.SchemePointTopology.Points (R := ℂ) X.hom)
      (TauCeti.SchemePointTopology.topology X.hom) := by
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

/-! ## Layer 6B: affine quotients by reductive subgroups -/

namespace AffineQuotients

/-- Matsushima's criterion, affine direction, for a subgroup that need not be connected. Over
an algebraically closed field `k` of characteristic zero, let `G` be an affine group of finite
type and `N` the closed subgroup cut out by the Hopf ideal `I`. If the identity component `N°`,
cut out by `I.identityComponent`, is reductive, then restriction of points to the right
`N`-invariant functions `O(G)^N = I.coinvariants` identifies the fppf homogeneous quotient `G/N`
with the sheaf of points of `Spec O(G)^N`; in particular `G/N` is affine (Arzhantsev, *Invariant
Ideals and Matsushima's Criterion*, Proposition 2.2, p. 2). The pinned
`TauCeti.HopfIdeal.isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` is the case
of connected `N`. For `μ₂` in `𝔾ₘ` the identity component is trivial, the invariants are
`k[t², t⁻²]` and `t ↦ t²` is the quotient map. Reductivity is needed: for the upper triangular
Borel subgroup of `SL₂` the quotient is the projective line, whose only global functions are
constants. -/
theorem isIso_fppfHomogeneousQuotientToCoinvariantsPoints {k : Type u} [Field k] [IsAlgClosed k]
    [CharZero k] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (I : TauCeti.HopfIdeal k H.obj)
    (hred : TauCeti.reductiveCommHopfAlgProperty k
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I.identityComponent)) :
    IsIso (I.fppfHomogeneousQuotientToCoinvariantsPoints (H := H.obj)) := by
  sorry

end AffineQuotients

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

namespace ParabolicLevi

/-- Levi complements of parabolic subgroups. Over any field `k`, let `G` be a reductive group
and `P` the parabolic `k`-subgroup cut out by the Hopf ideal `I` (the pinned
`TauCeti.HopfIdeal.IsParabolic`: over an algebraic closure `P` is smooth and contains a Borel
subgroup). Then `P` has a Levi `k`-subgroup: a closed subgroup `L`, cut out in `O(P)` by a Hopf
ideal `J`, on which the quotient map `P → P/R_{u,k}(P)` restricts to an isomorphism. With `I_u`
the defining Hopf ideal of the `k`-unipotent radical of `P`, the composite
`O(P)^{I_u} → O(P) → O(P)/J = O(L)` is bijective (Conrad–Feng, *Reductive Groups over Fields*,
§6.3, p. 58: `P = P_G(λ) = Z_G(λ) ⋉ U_G(λ)` for a `k`-cocharacter `λ`, and `R_{u,k}(P) = U_G(λ)`
descends the geometric unipotent radical). No hypothesis on the characteristic or on perfectness
of `k` enters. For the upper triangular Borel subgroup of `GL₂` the radical is `{1 + a E₁₂}` and
the ideal of the diagonal torus works; for `P = G` the radical is trivial and `J = 0` works. -/
theorem exists_levi_complement {k : Type u} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hI : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective
        ((Ideal.Quotient.mkₐ k J.toIdeal).comp
          (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry

end ParabolicLevi

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
/-! ## Layer 11: plane configurations and braid permutation monodromy -/

namespace BraidMonodromy

/-- Ordered configurations of `n` distinct points of the complex plane: the injective tuples
`PConf_n(ℂ)` of §11A, with the subspace topology of `ℂⁿ`. -/
def orderedConfiguration (n : ℕ) : Set (Fin n → ℂ) := {z | Function.Injective z}

/-- Unordered configurations `Conf_n(ℂ)` of §11A: the image of `orderedConfiguration n` in the
quotient of `ℂⁿ` by the permutation action `(σ • z) i = z (σ⁻¹ i)` (Mathlib's `arrowAction`),
with the subspace topology of the quotient topology. Since `orderedConfiguration n` is open and
stable under permutations, this space is homeomorphic to `PConf_n(ℂ)/S_n` with its quotient
topology. -/
def unorderedConfiguration (n : ℕ) :
    Set (Quotient (@MulAction.orbitRel (Equiv.Perm (Fin n)) (Fin n → ℂ) _ arrowAction)) :=
  Quotient.mk _ '' orderedConfiguration n

/-- Artin's theorem in the form of Fox and Neuwirth: at any configuration, the fundamental group
of the unordered configuration space of `n` points of the plane is the braid group on `n`
strands, Tau Ceti's Artin group of type `A_(n-1)` (Fox–Neuwirth, *The braid groups*, Math.
Scand. 10 (1962), §§6–7, pp. 122–126). For `n = 0` and `n = 1` the space is a point and a copy of
`ℂ` and both groups are trivial; for `n = 2` the space is homotopy equivalent to `ℂˣ` and both
groups are `ℤ`. -/
theorem nonempty_mulEquiv_braidGroup (n : ℕ) (z : Fin n → ℂ) (hz : z ∈ orderedConfiguration n) :
    Nonempty (FundamentalGroup (unorderedConfiguration n) ⟨Quotient.mk _ z, z, hz, rfl⟩ ≃*
      TauCeti.BraidGroup n) := by
  sorry

/-- The permutation map from braids on at least two strands admits no group-homomorphic
section; the exponent sum of an involution is zero, whereas a transposition has odd parity. -/
theorem permutation_extension_nonsplit (n : ℕ) (hn : 2 ≤ n) :
    ¬ ∃ s : Equiv.Perm (Fin n) →* TauCeti.BraidGroup n,
      (TauCeti.BraidGroup.permHom n).comp s = MonoidHom.id _ := by
  sorry

end BraidMonodromy

/-! ## Layer 11: the finite Weyl-arrangement theorem -/

namespace WeylArrangement
noncomputable section

variable {Λ M N : Type*} [AddCommGroup M] [Module ℂ M] [AddCommGroup N] [Module ℂ N]

/-- The complement in the root space `M` of the reflecting hyperplanes of the Weyl group: the
vectors on which no coroot vanishes, `V_reg` of §11B. -/
def weylRegularLocus (P : RootPairing Λ ℂ M N) : Set M := {v | ∀ i, P.coroot' i v ≠ 0}

/-- The regular orbit space `B_W = V_reg/W` of §11B: the image of `weylRegularLocus P` in the
orbit space of `M` under Mathlib's Weyl group `P.weylGroup` with its native action on the root
space, with the subspace topology of the quotient topology. -/
def weylRegularOrbitSpace (P : RootPairing Λ ℂ M N) :
    Set (Quotient (MulAction.orbitRel P.weylGroup M)) :=
  Quotient.mk _ '' weylRegularLocus P

/-- Brieskorn's theorem for finite Weyl arrangements. For a finite reduced crystallographic root
pairing `P` over `ℂ` on a finite-dimensional root space and a base `b`, the fundamental group of
the regular orbit space, at the class of any regular vector, is the Artin group of the Coxeter
matrix of `b` (Brieskorn, *Sur les groupes de tresses*, Séminaire Bourbaki 1971/72, exposé 401,
Proposition 1, p. 25, for a finite irreducible real reflection group acting on the
complexification of its real representation, proved in Brieskorn, Invent. Math. 12 (1971); Ernst,
*Cell Complexes for Arrangements with Group Actions*, Theorem 6.10, p. 46). On the span of the
roots `P` is the complexification of its real form, a product of root pairings gives a product
of orbit spaces, and the subspace on which every coroot vanishes is a contractible factor fixed
by the Weyl group. For `A₁` the regular orbit space is `ℂˣ/{±1} ≅ ℂˣ` and both groups are `ℤ`;
with no roots both groups are trivial. Applied to `P.flip` it gives the same statement for the
complement of the root hyperplanes in the coroot space. -/
theorem nonempty_mulEquiv_artinGroup [Finite Λ] [TopologicalSpace M] [IsModuleTopology ℂ M]
    [FiniteDimensional ℂ M] (P : RootPairing Λ ℂ M N) [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (v : M) (hv : v ∈ weylRegularLocus P) :
    Nonempty (FundamentalGroup (weylRegularOrbitSpace P) ⟨Quotient.mk _ v, v, hv, rfl⟩ ≃*
      TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b)) := by
  sorry

end
end WeylArrangement
end TauCetiRoadmap.ReductiveGroups
