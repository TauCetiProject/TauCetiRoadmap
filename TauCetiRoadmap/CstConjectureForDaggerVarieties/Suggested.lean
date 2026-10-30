module

import Mathlib

/-!
# The C_st-conjecture for dagger varieties: target signatures

The roadmap is README.md. This file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs when their actual carriers are available.
The following headline theorems are not statable at the pins; each item specifies
what its statement lacks. Mathlib's algebraic de Rham period-ring carriers and
Tau Ceti's adic spaces and Frobenius orbit space do not supply these realizations.

- Cohomological criteria for acyclicity (README §0.4): lacks the coherent geometric Fargues–Fontaine curve, its modified bundles and slope cohomology.
- Generation of the de Rham lattice (README §0.6): lacks the geometric positive semistable period ring and its de Rham embedding with Frobenius and monodromy.
- Period-valued Hom from an eigenspace (README §0.7): lacks the sympathetic-algebra VS category and compatible semistable period functors.
- Period-valued Hom from an acyclic kernel (README §0.8): lacks the C-lattice filtered module and natural VS period-Hom carriers.
- Period reconstruction modulo a power of t (README §0.9): lacks the bounded period kernel and natural VS Hom into truncated de Rham period functors.
- Twist invariance and the surjectivity reduction (README §1.4): lacks the analytic filtered cohomology square in the strict derived left heart.
- The simplified Stein and affinoid diagram (README §1.5): lacks smooth dagger Stein and affinoid spaces with analytic pro-étale, HK and differential-form cohomology.
- Bicartesian diagrams for proper, Stein and affinoid spaces (README §1.6): lacks the analytic fundamental square on actual proper, dagger Stein and affinoid cohomology.
- Kernel and cokernel descriptions (README §2.2): lacks modified coherent HK bundles and the analytic left-heart period diagram.
- The canonical qBC filtration on pro-étale cohomology (README §2.3): lacks natural TVS cohomology, torsion period Pairs and qBC curvature objects.
- The exact sequence with two failure terms (README §2.4): lacks qBC/TVS cohomology and its coherent bundle-cohomology failure objects.
- The height formula and its sign (README §2.5): lacks analytic qBC cohomology with signed height and modified HK bundles.
- The degreewise equivalence of comparison criteria (README §2.6): lacks small dagger spaces, qBC curvature and the adjacent syntomic cohomology object.
- The four conjectural properties for a small variety (README §2.7): lacks small dagger cohomology, bundle acyclicity, qBC curvature and height.
- Splitting the crystalline eigenspace complex (README §2.8): lacks the overconvergent log-crystalline complex of a dagger space, its comparison with completed-unramified Hyodo–Kato cohomology and its derived Frobenius eigenspace in the strict category.
- A noncanonical decomposition of syntomic cohomology (README §2.9): lacks the analytic syntomic TVS object and reasonable period Pairs.
- Nonnegative de Rham slopes for products (README §3.2): lacks small dagger spaces with filtered HK modifications and compatible cup products.
- Algebraic analytifications have nonnegative slopes (README §3.3): lacks dagger analytification and its filtered analytic HK realization.
- Almost proper varieties have nonnegative slopes (README §3.4): lacks proper smooth rigid pairs and their logarithmic and naive filtered period cohomology.
- The logarithmic and naive filtration discrepancy (README §3.5): lacks the logarithmic period and pro-étale complexes in their compatible left-heart realization.
- Comparison for semistable tube complements (README §3.6): lacks weak formal generic fibres, dagger tubes and their filtered analytic HK realization.
- Small tubular neighbourhoods in projective space (README §3.7): lacks projective dagger tube complements with their analytic HK period realizations.
- The inverse-limit obstruction sequence (README §4.2): lacks countable systems of strict derived analytic cohomology complexes and their descent maps.
- A de Rham criterion for R¹lim vanishing (README §4.3): lacks the natural finite BC quotients of analytic cohomology systems.
- Étale Künneth with a proper factor (README §4.4): lacks rigid analytic integral étale cohomology and proper analytic base change.
- R¹lim vanishing for proper times Stein (README §4.5): lacks proper-times-Stein analytic pro-étale cohomology and strict exhaustion descent.
- Pro-étale Künneth for proper times Stein (README §4.6): lacks the cup-product map on proper-times-Stein analytic pro-étale cohomology.
- The fundamental diagram for proper times Stein (README §4.7): lacks the fundamental left-heart square of the possibly non-small proper-times-Stein space.
- Vanishing on the differential error term (README §5.1): lacks dagger differential-form cohomology with natural completed Galois representations and Fontaine periods.
- Vanishing on the arithmetic torsion kernel (README §5.2): lacks the actual analytic filtered-cohomology torsion kernel with its topology and Galois action.
- Arithmetic pro-étale-to-de Rham recovery (README §5.3): lacks dagger pro-étale and filtered HK/de Rham realizations with smooth Galois period-Hom.
- Geometric pro-étale-to-period-module recovery (README §5.4): lacks the natural analytic TVS functor and period functors on sympathetic algebras.
- Positive crystalline recovery for affinoids (README §5.5): lacks the natural analytic TVS and positive crystalline period functors, plus their completed unramified scalar extension.

Proper rigid comparison over K and C is consumed from CohomologyComparisons
§§4.10–4.11, rather than stated a second time. The unrestricted smooth-dagger
C_st and period-recovery conjectures are not unconditional theorem targets.
The positive crystalline refinement retains its separate positivity proof
obligation; the syntomic splitting retains its continuous-splitting obligation.
-/

namespace TauCetiRoadmap.CstConjectureForDaggerVarieties

end TauCetiRoadmap.CstConjectureForDaggerVarieties
