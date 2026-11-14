module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.Hopf.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.Representation.SemisimplePoint.Basic
public import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
public import TauCeti.Algebra.AlgebraicGroup.FiniteType.CommHopfAlgCat
public import TauCeti.Algebra.Coalgebra.Comodule.PointsAction
public import TauCeti.Algebra.Coalgebra.Comodule.Finite.Basic
public import TauCeti.Algebra.AlgebraicGroup.Torus.Maximal
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Conjugation
public import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
public import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.BaseChange
public import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
public import TauCeti.Topology.Algebra.PointTopology.Group

/-!
# Reductive groups, part III: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib and
Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with `sorry`, and
the definitions they need: the algebra of regular class functions of a commutative Hopf algebra,
presented as an equalizer of two coordinate maps (README §0.1), and, for an affine group of finite
type over `ℚ`, the Serre condition, prime-units, prime-Weil numbers, prime-Weil points and neat
points (README §§3.1–3.5).

Stated here:

* the separation of semisimple classes by characters of finite-dimensional representations
  (README §0.5);
* finiteness of the map of class-function algebras induced by a closed immersion of a connected
  reductive group (README §0.6);
* rational descent of a number field that embeds in `ℚ_ℓ` for almost every prime `ℓ` (README §1.2(a));
* Harder's approximation of finitely many local maximal tori by one global maximal torus
  (README §2.2);
* the Serre-unit criterion: on a `ℚ`-torus satisfying the Serre condition, the `l`-Weil points are
  the `l`-units (README §3.6);
* density of neat Weil points: on such a torus split at `l`, one power map sends every `l`-Weil
  point to a neat point and the image is Zariski dense (README §3.7).

The quotient construction and geometric semisimple-class classification are supplied by
ArithmeticGaloisRepresentations §1.11; simultaneous Mumford–Tate factorization and embedding
transport are supplied by ShimuraVarieties §7.0i.1.

Headline theorems that are not statable at the pins, and what each lacks:

* Group Chevalley restriction `C(G) ≅ O(T)^W` (README §0.3): the pinned Tau Ceti has the finite
  normalizer action on the character group of a diagonalizable subgroup, but no action of the Weyl
  group of a maximal torus of a reductive group on the torus coordinate ring.
* Global torus classes with prescribed real component and the global cocharacter twist (README §2.1,
  §2.5): the discrete Galois modules of points of a torus or a reductive group over `ℚ̄` and over
  the algebraic closures of the completions, with their local and global Galois cohomology and
  localization maps (Mathlib has continuous cohomology of topological representations, but not these
  modules or maps), and the Hodge cocharacter of a map from the Deligne torus.
* The relative inner-form obstruction and one-prime rational-realization theorem (README §§5.7a–5.8):
  nonabelian cohomology of reductive groups, inner twists and adelic stable-class invariants.
* Conjugacy of common-source realizations (README §4.1): the orthogonal outer quotient `Conj′` and the
  group `Aut′` of automorphisms of a reductive group.
* Rational torus embeddings into quasi-split groups, local-to-global transfer of maximal tori and
  rational tori for common realizations (README §§4.3–4.5): inner twists, quasi-split inner forms and
  Galois cohomology of reductive groups.
* The odd unitary similitude Hasse principle (README §4.6): nonabelian Galois cohomology `ker¹(ℚ,G)` of
  a reductive group over `ℚ`.
* The common rational Frobenius class, its real elliptic representative and its rational
  representative for abelian varieties (README §5.5, §5.7, §5.9): the `ℓ`-adic Galois
  representations on the first cohomology of an abelian variety over a number field, its Betti
  cohomology with Hodge structure and Mumford–Tate group, good reduction and geometric Frobenius.
-/

public section

namespace TauCetiRoadmap.ReductiveGroupsPartIII

open TensorProduct WithConv NumberField IsDedekindDomain

universe u

/-! ## Layer 0: Conjugacy quotients and semisimple classes -/

/-- The algebra of regular class functions of a commutative Hopf algebra `H` over `k`: the
equalizer of the coordinate map of left conjugation `H → H ⊗ H` (conjugating point in the first
factor) and the second-factor inclusion `h ↦ 1 ⊗ h`. An element lies in it exactly when its values at
`g x g⁻¹` and at `x` agree for all points with values in every commutative `k`-algebra; it is the
arity-one invariant coordinate algebra of IntegralHeckeAndGaloisDeterminants §0.7, and the
coordinate ring of the conjugacy quotient `Conj(G)` (KZ25 §5.1.3). -/
noncomputable def classFunctions (k : Type*) (H : Type*) [CommRing k] [CommRing H]
    [HopfAlgebra k H] : Subalgebra k H :=
  AlgHom.equalizer (TauCeti.HopfAlgebra.conjugationAlgHom (R := k) (H := H))
    (Algebra.TensorProduct.includeRight (R := k) (A := H) (B := H))

/-- Characters separate semisimple classes: for a connected reductive group over an algebraically
closed field `Ω`, two semisimple `Ω`-points are conjugate if and only if they have the same trace on
every finite-dimensional comodule (Steinberg65, Corollary 6.6 (a)⇔(c); README §0.5). A single
faithful representation does not suffice: `2` and `1/2` in `G_m` have the same characteristic
polynomial under `t ↦ diag(t, t⁻¹)`. -/
theorem isConj_iff_trace_eq {Ω : Type u} [Field Ω] [IsAlgClosed Ω]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} Ω)
    (hH : TauCeti.reductiveCommHopfAlgProperty Ω H)
    {x y : WithConv (H →ₐ[Ω] Ω)}
    (hx : TauCeti.HopfAlgebra.IsSemisimplePoint x)
    (hy : TauCeti.HopfAlgebra.IsSemisimplePoint y) :
    IsConj x y ↔ ∀ M : TauCeti.FGComoduleCat.{u, u, u} Ω H,
      LinearMap.trace Ω _ (TauCeti.Comodule.endOfPoint M x.ofConv) =
        LinearMap.trace Ω _ (TauCeti.Comodule.endOfPoint M y.ofConv) := by
  sorry


/-- Finiteness of the quotient map of a closed immersion: let `G` be a connected reductive group over
a field `k` and `G → H` a closed immersion into an affine group of finite type, given by a surjective
bialgebra map `f : O(H) → O(G)`. The induced algebra map `q : C(H) → C(G)` of regular class functions,
the restriction of `f` (pinned down by `hq`), is finite. Injectivity on quotient points is not
claimed: `t ↦ diag(t, t⁻¹)` sends `2` and `1/2` to one point of `Conj(GL₂)` (KZ25 §5.3.2; README §0.6). -/
theorem finite_classFunctions_map {k : Type u} [Field k]
    (H G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hG : TauCeti.reductiveCommHopfAlgProperty k G)
    (f : H.obj →ₐc[k] G.obj) (hf : Function.Surjective f)
    (q : classFunctions k H.obj →ₐ[k] classFunctions k G.obj)
    (hq : (classFunctions k G.obj).val.comp q =
      (f : H.obj →ₐ[k] G.obj).comp (classFunctions k H.obj).val) :
    q.Finite := by
  sorry

/-! ## Layer 1: Arithmetic descent and quotient injections -/

/-- Rational descent from local embeddings: a number field `K` that embeds in `ℚ_ℓ` for every prime
`ℓ` outside a finite set `S` is `ℚ`. Route: Chebotarev puts every conjugacy class of the Galois group
of a Galois closure into the Frobenius classes outside `S`, each meets the subgroup fixing `K`, and
Jordan's lemma makes that subgroup everything. "Infinitely many `ℓ`" does not suffice: `ℚ(i)` embeds
in `ℚ_ℓ` for every `ℓ ≡ 1 mod 4` (KZ25 §5.3.6; README §1.2(a)). -/
theorem finrank_eq_one_of_embeddings_padic {K : Type u} [Field K] [NumberField K] (S : Finset ℕ)
    (hK : ∀ (ℓ : ℕ) [Fact ℓ.Prime], ℓ ∉ S → Nonempty (K →+* ℚ_[ℓ])) :
    Module.finrank ℚ K = 1 := by
  sorry

/-! ## Layer 2: Global tori and real cocharacter adjustment -/

/-- Harder's approximation of maximal tori: for a connected reductive group `G` over a number field
`F`, a finite set `S` of finite places and a finite set `S'` of archimedean places, and maximal tori
`T v` of `G` over the completions at the places of `S` and `T' w` at those of `S'`, there is a maximal
`F`-torus of `G` whose base change to each of these completions is conjugate, by a rational point of
`G` over that completion, to the prescribed torus (Harder66 Lemma 5.5.3; KMPS22 Lemma 1.2.2;
Borovoi98 Lemma 5.6.3; README §2.2). -/
theorem exists_isMaximalTorus_conjugate {F : Type u} [Field F] [NumberField F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (hH : TauCeti.reductiveCommHopfAlgProperty F H)
    (S : Finset (HeightOneSpectrum (𝓞 F))) (S' : Finset (InfinitePlace F))
    (T : ∀ v : HeightOneSpectrum (𝓞 F), TauCeti.HopfIdeal (v.adicCompletion F)
      (TauCeti.CommHopfAlgCat.baseChange (K := v.adicCompletion F) H.obj))
    (hT : ∀ v ∈ S, TauCeti.HopfIdeal.IsMaximalTorus (v.adicCompletion F)
      (TauCeti.CommHopfAlgCat.baseChange (K := v.adicCompletion F) H.obj) (T v))
    (T' : ∀ w : InfinitePlace F, TauCeti.HopfIdeal w.Completion
      (TauCeti.CommHopfAlgCat.baseChange (K := w.Completion) H.obj))
    (hT' : ∀ w ∈ S', TauCeti.HopfIdeal.IsMaximalTorus w.Completion
      (TauCeti.CommHopfAlgCat.baseChange (K := w.Completion) H.obj) (T' w)) :
    ∃ I : TauCeti.HopfIdeal F H.obj, TauCeti.HopfIdeal.IsMaximalTorus F H.obj I ∧
      (∀ v ∈ S, ∃ g, TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := v.adicCompletion F) I =
        (T v).conjugate g) ∧
      (∀ w ∈ S', ∃ g, TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := w.Completion) I =
        (T' w).conjugate g) := by
  sorry

/-! ## Layer 3: Serre tori, prime-units, Weil points and rigidity -/

section SerreTori

open scoped TauCeti.PointTopology

/-- The Serre condition on an affine group `T` of finite type over `ℚ`, used for tori: some
`ℚ`-split subtorus of `T` (a Hopf ideal `J` with split-torus quotient) base changes to a maximal
`ℝ`-split subtorus of `T_ℝ`. Hopf ideals reverse inclusions of closed subgroups, so `Minimal` among
ideals with split-torus quotient is maximality among split subtori; in a torus there is exactly one
maximal split subtorus (KMPS22 §2.2.3; README §3.1). -/
def IsSerreTorus (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ) : Prop :=
  ∃ J : TauCeti.HopfIdeal ℚ H.obj,
    TauCeti.splitTorusCommHopfAlgProperty ℚ (TauCeti.FiniteTypeCommHopfAlgCat.quotient H J) ∧
    Minimal (fun I : TauCeti.HopfIdeal ℝ (TauCeti.CommHopfAlgCat.baseChange (K := ℝ) H.obj) =>
        TauCeti.splitTorusCommHopfAlgProperty ℝ
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient
            (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := ℝ) H) I))
      (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := ℝ) J)

/-- A rational point `γ` of an affine group of finite type over `ℚ` is an `l`-unit: for every prime
`v ≠ l` the subgroup `{γⁿ : n ∈ ℤ}` is relatively compact in the group of `ℚ_v`-points, for Tau
Ceti's point topology. No condition is imposed at the real place (KMPS22 §2.2.3; README §3.2, the
case `F = ℚ`). -/
def IsPrimeUnit (l : ℕ) (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ)
    (γ : WithConv (H →ₐ[ℚ] ℚ)) : Prop :=
  ∀ (v : ℕ) [Fact v.Prime], v ≠ l →
    IsCompact (closure (Set.range fun n : ℤ =>
      (toConv ((Algebra.ofId ℚ ℚ_[v]).comp (γ ^ n).ofConv) : WithConv (H →ₐ[ℚ] ℚ_[v]))))

/-- A complex number `α` is an `l`-Weil number of weight `w`: it is algebraic, every conjugate has
absolute value `l ^ (w / 2)`, and it is a unit at every finite place not above `l`, that is, `lⁿ α`
and `lⁿ α⁻¹` are algebraic integers for some `n`. The weight may be negative and `α` need not be
integral at `l`; `0` is excluded by the absolute values (KMPS22 §2.2.1; README §3.3). -/
def IsPrimeWeilNumber (l : ℕ) (w : ℤ) (α : ℂ) : Prop :=
  IsIntegral ℚ α ∧ (∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (l : ℝ) ^ ((w : ℝ) / 2)) ∧
    ∃ n : ℕ, IsIntegral ℤ ((l : ℂ) ^ n * α) ∧ IsIntegral ℤ ((l : ℂ) ^ n * α⁻¹)

/-- A rational point `γ` of an affine group of finite type over `ℚ` is an `l`-Weil point: on every
finite-dimensional comodule each eigenvalue of `γ` is an `l`-Weil number, of a weight that may
depend on the eigenvalue. By README §3.4 it suffices to test one faithful representation
(KMPS22 §2.2.1). -/
def IsPrimeWeilPoint (l : ℕ) (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ)
    (γ : WithConv (H →ₐ[ℚ] ℚ)) : Prop :=
  ∀ M : TauCeti.FGComoduleCat.{0, 0, 0} ℚ H,
    ∀ α ∈ (LinearMap.charpoly (TauCeti.Comodule.endOfPoint M γ.ofConv)).aroots ℂ,
      ∃ w : ℤ, IsPrimeWeilNumber l w α

/-- A rational point `γ` of an affine group of finite type over `ℚ` is neat: on every
finite-dimensional comodule its eigenvalues generate a torsion-free subgroup of `ℂˣ`. This is the
eigenvalue condition of AdelicAlgebraicGroups §4.3 imposed on every representation; for a
semisimple point it says that the Zariski closure of `{γⁿ}` is a torus (README §3.5, the case
`F = ℚ`). -/
def IsNeatPoint (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ) (γ : WithConv (H →ₐ[ℚ] ℚ)) : Prop :=
  ∀ M : TauCeti.FGComoduleCat.{0, 0, 0} ℚ H,
    ∀ u ∈ Subgroup.closure
      {u : ℂˣ | (u : ℂ) ∈ (LinearMap.charpoly (TauCeti.Comodule.endOfPoint M γ.ofConv)).aroots ℂ},
      IsOfFinOrder u → u = 1

/-- The Serre-unit criterion: on a `ℚ`-torus satisfying the Serre condition, a rational point is an
`l`-Weil point if and only if it is an `l`-unit. The Serre condition is needed: `2 + √3` in the
norm-one torus of `ℚ(√3)` is an `l`-unit for every `l` and is not a Weil point
(KMPS22 Lemma 2.2.4; README §3.6). -/
theorem isPrimeWeilPoint_iff_isPrimeUnit (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ)
    (hT : TauCeti.torusCommHopfAlgProperty ℚ H) (hS : IsSerreTorus H)
    (l : ℕ) [Fact l.Prime] (γ : WithConv (H →ₐ[ℚ] ℚ)) :
    IsPrimeWeilPoint l H γ ↔ IsPrimeUnit l H γ := by
  sorry

/-- Density of neat Weil points: let `T` be a `ℚ`-torus satisfying the Serre condition and `l` a
prime at which `T` is split. There is `m > 0` such that the `m`-th power of every `l`-Weil point is
neat, and a regular function vanishing at the `m`-th powers of all `l`-Weil points is zero: these
powers, themselves `l`-Weil points, are Zariski dense in `T`, and so are the `l`-Weil points. The
splitting at `l` is needed: in the norm-one torus of an imaginary quadratic field in which `l` is
inert the `l`-Weil points are roots of unity (KMPS22 Lemma 2.2.10; README §3.7). -/
theorem exists_pow_isNeatPoint_dense (H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ)
    (hT : TauCeti.torusCommHopfAlgProperty ℚ H) (hS : IsSerreTorus H)
    (l : ℕ) [Fact l.Prime]
    (hl : TauCeti.splitTorusCommHopfAlgProperty ℚ_[l]
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := ℚ_[l]) H)) :
    ∃ m : ℕ, 0 < m ∧
      (∀ γ : WithConv (H →ₐ[ℚ] ℚ), IsPrimeWeilPoint l H γ → IsNeatPoint H (γ ^ m)) ∧
      ∀ f : H.obj, (∀ γ : WithConv (H →ₐ[ℚ] ℚ), IsPrimeWeilPoint l H γ → (γ ^ m).ofConv f = 0) →
        f = 0 := by
  sorry

end SerreTori

end TauCetiRoadmap.ReductiveGroupsPartIII
