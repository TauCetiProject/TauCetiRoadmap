# Global number fields: completion audit

The definitive specification is [README.md](README.md), including its carrier conventions,
twelve layers, consumer contracts and twenty-four rejection tests. The admitted historical
`Suggested.lean` is a design aid, not a proof certificate.

The final source prerequisite is [Tau Ceti #22015](https://github.com/TauCetiProject/TauCeti/pull/22015),
which supplies both characteristic equations for `classMap`: its action on principal ray classes
and on residue/sign ray classes. Bors reported that exact head `ea05ae6ffecd` merged on
2026-10-28. Direct inspection of upstream `f5604a97062487140a029c405f32d8f199f2316b` confirms
both equations remain present; subsequent changes in their module add an integral-principal-ideal
comparison and do not weaken either equation.

Paths below are relative to `TauCeti/NumberTheory/NumberField/Global/`.

| Normative layer | Native implementation and preserved contract |
| --- | --- |
| 0: places and completions | `Places/{Basic,Completion,Extension,Height}.lean` use Mathlib's finite/infinite places, normalized real and squared-complex absolute values, product formula and local-degree comparisons. |
| 1: weak approximation | `Approximation/Weak.lean` supplies mixed finite/infinite completion density, unit-valued approximation and signs; no local reciprocity is assumed. |
| 2: ray-class carriers | `RayClass/{Modulus,Basic,Integral,Exact,Finite,ClassNumber}.lean` retain the coprime integral-ideal source, intrinsic fractional-generator triviality criterion, integral corollary, transitions and unit/sign obstruction. `RayClass/Narrow/` supplies the narrow/wide comparison. |
| 3: uniform ideal counting | `Counting/RayFundamentalDomain/` and `RayClass/Count/Asymptotic.lean` prove the lattice estimate and one power-saving estimate uniform over ray classes. `RayClass/MainTerm.lean` retains all finite Euler factors; `RayClass/Character/PartialSums.lean` cancels the main term only for a nontrivial character. |
| 4: finite adeles | `Adeles/Basic.lean` and the existing Mathlib finite-adele API use the canonical restricted-product carrier and dense diagonal embedding. |
| 5: full adeles | `Adeles/{LocallyCompact,Discrete,CompactQuotient}.lean` give local compactness, discrete full diagonal and compact additive quotient, with no false discreteness claim for finite adeles. |
| 6: ideles and norm one | `Ideles/{Basic,LocallyCompact}.lean` and `Ideles/Norm/` use the units topology, principal-norm-one identity, norm splitting and compact norm-one quotient. |
| 7: ray dictionary | `Ideles/{Congruence,IdentityComponent}.lean` and `Ideles/Ray/{Subgroup,ClassQuotient,OpenSubgroup}.lean` supply the open congruence subgroups, surjective quotient with exact kernel, transition compatibility and cofinality among open subgroups. |
| 8: extension and norm | `Adeles/{BaseChange,Extension,GaloisAction,GaloisDescent}.lean`, `Adeles/Norm/`, and `Ideles/{Extension,GaloisAction,GaloisDescent}.lean` retain the continuous adelic algebra equivalence, tower, Galois and norm comparisons. |
| 9: characters | `RayClass/Character/` and `HeckeCharacter/` supply finite ray and continuous idele-class characters, conductors, finite-order correspondence and unique real norm shift. |
| 10: cyclotomy and infinity types | `Cyclotomic/RayClass.lean`, `InfinityType/`, and `HeckeCharacter/{Algebraic,InfinityType,Purity,RealParity,Weight}.lean` keep continuous complex exponents, algebraic integer exponents and finite-order signs distinct; algebraicity is tested on the identity component. |
| 11: orders | `Orders/` supplies conductors, invertible proper fractional ideals, Picard and narrow Picard groups, their exact comparison, maximal-order specializations and conductor-away functoriality. `Orders/CubeRootTwo.lean` retains the proper noninvertible cubic ideal; the full ideal class monoid is not made a group. |

The audit preserves the twenty-four rejection tests in the README. In particular, it does not
replace the uniform ray-class error term by total ideal counting, drop Euler factors, identify
all infinity types, use a subspace topology for ideles, demand equality beyond the identity
component for algebraicity, omit the topology from base change, or treat every proper ideal of
an order as invertible. Local/global reciprocity and ring-class fields remain outside this
roadmap, with the named downstream owners unchanged.

The source-presence verification is independent of the roadmap's older Tau Ceti
`358314d4ab97` / Mathlib `f6090c7095e1` / Lean `4.35.0-rc3` prototype build. Final archival
verification also replays the selected native entry modules on actual merged source.

AI assistance: scope and source audit with Codex (GPT-6), 2026-10-28.
