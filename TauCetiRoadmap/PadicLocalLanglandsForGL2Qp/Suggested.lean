import Mathlib
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic

/-!
# P-adic local Langlands for GL₂(ℚ_p): headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its headline targets.

The statements here give shared Hilbert–Samuel existence and uniqueness for finite
modules over noetherian local rings with an ideal of definition on the module (§0.5),
and finite representation length for finitely generated admissible smooth torsion
representations of GL₂(ℚ_p) over the ring of integers of any finite extension of ℚ_p
(§2.2), at every prime. The polynomial theorem supplies the single polynomial used
by the graded-series and maximal-ideal specializations: the latter sets I to the
maximal ideal, and ambient multiplicity extracts the dimension-normalized coefficient
at the ambient dimension. The representation-length theorem uses
Mathlib's actual integer ring, torsion submodules and group-algebra module, together
with Tau Ceti's smooth-discrete predicate. The two definitions below express its
central-character and compact-open admissibility hypotheses on those carriers.

The other headline signatures require objects absent from the pins. The analytic
duality and analytic-vector theorems (§0.1, §§2.4–2.5) need locally convex analytic
function/distribution spaces and admissible Banach representation categories.
The filtered-period equivalence, the normalization comparisons with the supplied
monodromy and period realization, and the deformation theorems (§§0.2–0.4)
need period rings, filtered (φ,N)-modules, coefficient-linear compact duality and
GLₙ-valued local deformation functors with their actual universal continuous lifts.
Their representing-pair comparison preserves those lifts and their fixed residual bases.
The canonical lattices and trianguline classification
(§§1.3–1.7) need étale and Robba (φ,Γ)-modules and Weil–Deligne parameters.

The mod-p classification (§§2.6–2.8) needs smooth compact induction, its Hecke
operator and Serre-weight representations. The Montreal, reconstruction and
all-prime correspondence theorems (Layer 3) need those constructions, Colmez's
glued section spaces and admissible unitary Banach representations. Algebraic and
analytic vector comparisons and completion classifications (Layer 4) also need
filtered periods, locally analytic induction and inertial types. Section 4.4's common
supercuspidal type-occurrence and multiplicity-one theorem, including its finite
coefficient-field Hom comparison, needs compact types and smooth representation
carriers. Section 4.1k's
cyclic Kirillov period model is constructed for D(−ℓ), with weights (0,k), and
transported to D by the determinant character ε^ℓ, including the B-action and
positive period lattices. Its locally constant coefficients multiply (tx)^i;
the ordinary coefficients of t^i include the factor x^i. Section 4.9's
compactly supported P-finite space lies in the analytic vectors and is dense in the
Banach representation; density in the locally analytic topology for a supersingular
object requires its Galois representation to be nontrianguline. These spaces also
require the analytic representation carriers. Section 4.6 uses
the normalized classical Weil parameter and its raw lift: a repeated scalar
parameter is lifted to the regular nonsplit Frobenius extension before imposing
weak admissibility, while monodromy varies in the filtration locus. Section 4.1a
uses NoncommutativeAndEquivariantIwasawa §F.6's general continuous period boundary;
its Colmez presentation and dual-exponential adjunction require generalized
differential-period spaces. Its exponential heart is the image of the ψ-fixed
generalized period module under ∇ₖ(1 − φ), characterized by the twists V(−i), paired with
the dual-exponential tests on V̌(i) for 0 ≤ i < k. The block-centre,
type-ring and Breuil–Mézard theorems (Layer 5, §§6.0–6.8) need compact block
categories, their projective envelopes, continuous (pseudo)deformation/type rings
and module-cycle specialization. Mathlib's algebraic-cycle carrier alone does not
supply these objects. Section 5.5(v)'s functor is an equivalence from the opposite
finite-length Banach category to finite-length deformation-ring modules:
the Banach functor V̌(B) = Hom_L(V(B), L)(ζε) reverses arrows, and so does
postcomposition on Hom_G(Vᵘ, V̌(B)). Its Banach category and universal Galois
deformation are among these absent carriers.
On the characteristic-zero irreducible locus the block
algebra is Azumaya; in the scalar-residual case, splitting over a completed centre
requires a two-dimensional model of the pseudotrace over the point's residue field.
Section 4.3's all-prime nonspecial crystalline completion,
including double roots, needs the trianguline and universal unitary completion
carriers. Sections 5.8–5.9's envelope comparisons for p ≥ 3 with their residual
exclusions, and §5.8's all-prime orthonormalizable universal family for absolutely
irreducible residual representations, need those representation and deformation
categories as well. The Jacquet–Langlands and Breuil–Strauch comparisons (§6.9)
need the smooth transfer, Drinfeld covers, their function/differential spaces and
de Rham cohomology. Their ρ-superscripts denote continuous equivariant-Hom
multiplicity spaces, with the subspace topology in the finite product Hom_L(ρ, X).
Over the splitting coefficient field, evaluation identifies ρ ⊗ Hom_D×(ρ, X)
with the full projector image.
These results have no substitute statements here.
-/

open ValuativeRel

namespace TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

/-- Section 0.5: lengths modulo powers of an ideal of definition on a finite module
agree eventually with a unique rational polynomial. Its specialization at the maximal
ideal supplies the same polynomial to the ambient multiplicity construction.
The ideal lies in the maximal ideal and M/IM has finite length;
it need not be m-primary in the ring.
The finite-length assertion keeps the natural-valued length faithful to module length.
Source: Stacks, Algebra, Proposition 10.59.5 (tag 00K8), applied over A/ann(M),
or Proposition 10.58.7 (tag 00K1) on the associated graded module. -/
theorem exists_hilbertSamuel_polynomial
    (A : Type*) [CommRing A] [IsNoetherianRing A] [IsLocalRing A]
    (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]
    (I : Ideal A) (hI : I ≤ IsLocalRing.maximalIdeal A)
    (hM : IsFiniteLength A (M ⧸ (I • (⊤ : Submodule A M)))) :
    ∃! P : Polynomial ℚ,
      (∀ n : ℕ, IsFiniteLength A (M ⧸ (I ^ (n + 1) • (⊤ : Submodule A M)))) ∧
      ∀ᶠ n : ℕ in Filter.atTop,
        ((Module.length A (M ⧸ (I ^ (n + 1) • (⊤ : Submodule A M)))).toNat : ℚ) =
          P.eval (n : ℚ) := by
  sorry

namespace SmoothTorsion

variable {p : ℕ} [Fact p.Prime]
variable {O : Type*} [CommRing O] [TopologicalSpace O]

/-- The centre acts through the specified continuous scalar character. -/
def HasCentralCharacter
    (ζ : ContinuousMonoidHom ℚ_[p]ˣ Oˣ)
    (X : TopRep O (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p])) : Prop :=
  ∀ (a : ℚ_[p]ˣ) (v : X),
    X.ρ (Matrix.GeneralLinearGroup.scalar (Fin 2) a) v = (ζ a : O) • v

/-- Admissibility over a DVR: compact-open invariants killed by each positive power
of the uniformiser are finite modules. -/
def IsAdmissible (ϖ : O)
    (X : TopRep O (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p])) : Prop :=
  ∀ H : Subgroup (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]),
    IsOpen (H : Set (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p])) →
    IsCompact (H : Set (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p])) →
    ∀ n : ℕ, Module.Finite O
      (Submodule.torsionBy O (X.ρ.restrict H.subtype).invariants (ϖ ^ (n + 1)))

/-- Section 2.2: a finitely generated admissible smooth O_L-torsion representation
with fixed central character has finite O_L[GL₂(ℚ_p)]-length, for every prime.
Source: Paškūnas 2013, §2, pp.14–15, with its Emerton input. -/
theorem finiteLength_of_finitelyGenerated_admissible
    (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [TauCeti.FinitePadicExtension L p]
    (ϖ : 𝒪[L]) (hϖ : Irreducible ϖ)
    (ζ : ContinuousMonoidHom ℚ_[p]ˣ 𝒪[L]ˣ)
    (X : TopRep 𝒪[L] (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]))
    (hsm : TauCeti.IsSmoothDiscrete 𝒪[L] X)
    (htors : Module.IsTorsion 𝒪[L] X)
    (hζ : HasCentralCharacter ζ X) (hadm : IsAdmissible ϖ X)
    (hfg : Module.Finite (MonoidAlgebra 𝒪[L] (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]))
      X.ρ.toRepresentation.asModule) :
    IsFiniteLength (MonoidAlgebra 𝒪[L] (Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]))
      X.ρ.toRepresentation.asModule := by
  sorry

end SmoothTorsion

end TauCetiRoadmap.PadicLocalLanglandsForGL2Qp
