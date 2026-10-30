import Mathlib

/-!
# (φ,Γ)-modules and local Iwasawa cohomology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its milestones.

The projectivity theorem of §0.4 is stated on Mathlib's truncated Witt vectors.
Over a perfect characteristic-p ring, Witt Frobenius is an automorphism, so an
invertible Frobenius linearization is equivalently a bijective additive map with
the displayed semilinearity. No constant-rank or connectedness hypothesis is imposed.

The other headline results require constructions absent at the pins:

* Layer 0's Artin–Schreier–Witt descent equivalence needs the finite locally free
  étale coefficient-sheaf and Witt Frobenius-module categories and their fixed-basis
  torsors. Small-group Lang classification needs the small-lattice Greenberg groups.
  Compact finite descent needs the derived compact-cochain carrier and coherent
  quotient actions. Section 0.6 specializes the cochains and local Tate duality
  supplied by NoncommutativeAndEquivariantIwasawa §F.3, together with its derived
  Hochschild–Serre comparison; the Milnor sequence uses these same cochains.
* Layer 1's realization, slope filtration, overconvergence and decompletion theorems
  need the cyclotomic period rings, Robba rings, radius models and their module
  categories. The period-sheaf, curve and B-pair comparisons need their period
  sheaves and patching rings.
* Layers 2–4's arithmetic φ/ψ-Herr comparison, Galois comparison, finiteness,
  perfectness, Tate duality and derived base change need those modules, period ψ
  and the relative analytic Γ rings. Abstract operator identities alone do not
  state these arithmetic theorems.
* Layer 5's integral and analytic Iwasawa comparisons need the independent
  corestriction tower, its Shapiro maps and the period realization. The pairing
  specialization needs the residue-normalized analytic pairing; generation needs
  the Robba-type Γ annuli. Section 5.7 reexports the general continuous period
  boundaries, quotient-period injection and Bloch–Kato exponential supplied by
  NoncommutativeAndEquivariantIwasawa §F.6 on its §F.3 cochains. The supplied
  exponential has image H¹_e under a de Rham hypothesis. The all-level
  exponential-image theorem uses this package together with de Rham differential
  lattices and cyclotomic localization.
* Layer 6's Wach existence, good-basis and Iwasawa-interface theorems need the
  embedded Wach lattices, their filtered crystalline reduction and the positive
  analytic scalar extension `wachAnalyticModule V = B_rig,E^+ ⊗_(B_E^+) N(V)`.
  The analytic coordinate theorem uses this carrier; Layer 5's `deRhamDiffEq V`
  is the differential equation over the full Robba ring.
* Layer 7's rank-one family classification and global triangulation theorems need
  the relative Robba sheaves, character spaces, Sen modules, analytic Fitting
  modifications and coherent flags, including their saturated fiber constructions.

None of these missing objects is replaced by an arbitrary operator, complex or
predicate. The algebraic tensor and signed differential formulas remain README
infrastructure rather than acceptance statements.
-/

namespace TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

/-- Witt Frobenius on truncated Witt vectors over a ring of characteristic p. -/
def truncatedWittFrobenius (p n : ℕ) {R : Type*} [CommRing R] [CharP R p]
    (x : TruncatedWittVector p n R) : TruncatedWittVector p n R :=
  TruncatedWittVector.mk p (fun i => x.coeff i ^ p)

/-- Layer 0, §0.4: a finitely presented Witt module, flat over ℤ/pⁿℤ and
with invertible Frobenius linearization, is projective. -/
theorem wittProjective_of_flat_phi
    (p n : ℕ) [Fact p.Prime] (hn : 0 < n)
    (R : Type*) [CommRing R] [CharP R p] [PerfectRing R p]
    (M : Type*) [AddCommGroup M] [Module (TruncatedWittVector p n R) M]
    [Module.FinitePresentation (TruncatedWittVector p n R) M]
    [Module (ZMod (p ^ n)) M] [Module.Flat (ZMod (p ^ n)) M]
    (F : M ≃+ M)
    (hF : ∀ (a : TruncatedWittVector p n R) (x : M),
      F (a • x) = truncatedWittFrobenius p n a • F x) :
    Module.Projective (TruncatedWittVector p n R) M := by
  sorry

end TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology
