import Mathlib

/-!
# P-adic differential equations, rigid cohomology and p-adic weights: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib
and Tau Ceti, each with `sorry`; discharging all of them finishes neither a layer nor the
roadmap.

The statements here are Arabia's controlled lifting for smooth algebras modulo an
arbitrary ideal (RD.0.39) and the cyclic-vector theorem for a nonzero derivation over any
characteristic-zero field (RD.1.7).

The analytic headline results of RD.0 require annular function rings, the Robba and
Amice rings, weak completions and their topologies. These carriers are absent from the
pins. The radii, break decompositions and Dieudonné–Manin theorems of RD.1 and the slope
filtration, Tsuzuki finite monodromy, local monodromy and irregularity–Swan comparison
of RD.2 require differential and Frobenius modules over those rings. Mathlib's
`WittVector.Isocrystal` and its rank-one classification do not supply the ramified
coefficient and general Frobenius categories of those targets.

The frame independence, Dwork–Berthelot convergence, Katz–Crew correspondence and
coefficient equivalences of RD.3 require tubes, strict neighbourhoods and convergent and
overconvergent isocrystal categories. The Monsky–Washnitzer, Gysin, dagger and log
comparisons of RD.4 and the finiteness, descent, full faithfulness, Poincaré duality,
Künneth, Étesse descent and semistable reduction of RD.5 require these categories and rigid cohomology
with its support functors. None of these coefficient or cohomology carriers exists
at the pins.

The Lefschetz trace formula, rationality of coefficient L-functions, index formulas,
Fourier comparison and p-adic Weil II of RD.6 therefore have no signatures here. The
scalar hyper-Kloosterman sum and its numerical Deligne bound belong to
CongruenceSpectralGap §§4.2a–4.2b; the Kloosterman F-isocrystal and its purity (RD.6.95,
RD.6.97), which give a rigid proof of that bound, need the same absent carriers. RD.7's rigid–crystalline comparison with coefficients, equality of
rigid, crystalline and étale Weil factors, abelian-variety comparison, crystalline
lattice bounds and Kloosterman moment comparisons require the corresponding geometric
cohomology and filtered comparison objects, also absent from the pins. The weight-separated
extraction of integral factors that RD.7.5 adapts is `degreeFactorExtraction` of
DeligneWeightsAndPurity §4.4 and is not restated here.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

namespace RD0

universe u

/-- Arabia's controlled lifting theorem (RD.0.39(a)): a compatible smooth-algebra map
lifts after an étale neighbourhood of `IB · ker p`, retaining its reduction modulo `I`.
The map `hbar` factors through `S/IS` because its target is annihilated by `I`;
`hcompat` expresses compatibility modulo `IC` on quotient representatives. -/
theorem arabia_controlled_lifting
    {R S B C : Type u} [CommRing R] [CommRing S] [CommRing B] [CommRing C]
    [Algebra R S] [Algebra R B] [Algebra R C] [Algebra.Smooth R S]
    (I : Ideal R) (p : B →ₐ[R] C) (hp : Function.Surjective p) (φ : S →ₐ[R] C)
    (hbar : S →ₐ[R] (B ⧸ Ideal.map (algebraMap R B) I))
    (hcompat : ∀ (s : S) (b : B),
      Ideal.Quotient.mk (Ideal.map (algebraMap R B) I) b = hbar s →
        p b - φ s ∈ Ideal.map (algebraMap R C) I) :
    ∃ (E : Type u) (_ : CommRing E) (_ : Algebra B E)
      (_ : Algebra R E) (_ : IsScalarTower R B E),
      Algebra.Etale B E ∧
      Nonempty ((B ⧸ (Ideal.map (algebraMap R B) I * RingHom.ker p)) ≃ₐ[B]
        (E ⧸ Ideal.map (algebraMap B E)
          (Ideal.map (algebraMap R B) I * RingHom.ker p))) ∧
      ∃ (pE : E →ₐ[R] C) (hE : S →ₐ[R] E)
        (eI : (B ⧸ Ideal.map (algebraMap R B) I) ≃ₐ[B]
          (E ⧸ Ideal.map (algebraMap B E) (Ideal.map (algebraMap R B) I))),
        Function.Surjective pE ∧
        (∀ b : B, pE (algebraMap B E b) = p b) ∧ pE.comp hE = φ ∧
        ∀ s : S, Ideal.Quotient.mk
          (Ideal.map (algebraMap B E) (Ideal.map (algebraMap R B) I)) (hE s) =
            eI (hbar s) := by
  sorry

end RD0

namespace RD1

/-- A vector is cyclic when its successive covariant derivatives form a basis. -/
def CyclicFor {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (D : V → V) (n : ℕ) (v : V) : Prop :=
  ∃ b : Module.Basis (Fin n) K V, ∀ i, b i = (D^[i.val]) v

/-- The cyclic-vector theorem over any characteristic-zero differential field with
a nonzero derivation (RD.1.7). The connection is additive and satisfies Leibniz. -/
theorem katz_cyclic_vector {K V : Type*} [Field K] [CharZero K]
    [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (δ : Derivation ℤ K K) (hδ : δ ≠ 0) (D : V →+ V)
    (hD : ∀ (a : K) (v : V), D (a • v) = δ a • v + a • D v) :
    ∃ v : V, CyclicFor (K := K) D (Module.finrank K V) v := by
  sorry

end RD1

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology
