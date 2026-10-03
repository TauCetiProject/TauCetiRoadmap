# Sources, prioritization, and existing formalization

This is a provenance and coordination record, not an additional list of mathematical targets.
The specification is [README.md](README.md). Repository/PR observations below were checked
on **2026-09-15**; they distinguish inspected source from announcements and project goals.
External projects were inspected, not rebuilt or certified by this audit.

## The three books

Section numbers in the roadmap refer to these editions; Tao's author manuscript was checked alongside the AMS copy.

| Abbreviation | Reference and supplied file | Contribution to the roadmap |
| --- | --- | --- |
| AGZ | Greg W. Anderson, Alice Guionnet, Ofer Zeitouni, *An Introduction to Random Matrices*, Cambridge Studies in Advanced Mathematics 118, Cambridge University Press, 2010, ISBN 9780521194525. `AGZ-IntroRandomMatrices.pdf` | Ch. 2: Wigner methods, concentration, Gaussian densities, large deviations. Ch. 3: determinantal/Pfaffian formulas and Gaussian local limits. §§4.1–4.5: invariant integration, point processes, dynamics, beta models. §§5.2–5.4: free probability and matrix realizations. |
| T | Terence Tao, *Topics in Random Matrix Theory*, Graduate Studies in Mathematics 132, AMS, 2012. `Tao-TopicsRMT-AMS-GSM132.pdf`, `Tao-TopicsRMT-AUTHORS-OWN.pdf` | §1.1: law-invariant probability arguments. §1.3: matrix inequalities. §§2.1–2.4: concentration, replacement, norms and semicircle methods. §§2.5–2.8: freeness, Gaussian ensembles, invertibility and the circular law. Ch. 3: dynamics and trace inequalities. |
| PB | Marc Potters, Jean-Philippe Bouchaud, *A First Course in Random Matrix Theory: For Physicists, Engineers and Data Scientists*, Cambridge University Press, 2020, ISBN 9781108488082. `Potters-Bouchaud-FirstCourseRMT.pdf` | Chs. 1–7: spectral calculus and classical ensembles. Chs. 9–12, 15: dynamics, free transforms and sums/products. Ch. 14: spikes and overlaps. Ch. 17, §§19.1–19.3: population covariance and rotationally invariant estimation. |

PB deliberately develops an informal calculus. The roadmap replaces its informal self-averaging,
cavity, and boundary-value steps by explicit convergence and integrability targets. In particular,
the nonlinear-shrinkage target is an integrated weighted-spectral-measure theorem, not an
unjustified assertion about convergence of every individual eigenvector overlap.

Supplementary primary sources for technical steps discussed or sketched in the books:

- Tao and Vu, with an appendix by Krishnapur,
  [*Random matrices: Universality of ESDs and the circular law*](https://arxiv.org/abs/0807.4898):
  replacement and logarithmic-integrability arguments for the finite-variance circular law.
- Rudelson and Vershynin,
  [*The smallest singular value of a random rectangular matrix*](https://arxiv.org/abs/0802.3956):
  the invertibility estimates and compressible/incompressible decomposition.

## What the supplied Zulip discussions change about priority

### Sample-space extensions come first

In [Formalizing Probabilistic Arguments](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Formalizing.20Probabilistic.20Arguments/with/522877620),
David Ledvinka asks how to add independent randomness without repeatedly rebuilding a
probability space and transporting every hypothesis. Lawrence Wu points to PFR's independent
copies. Milestone 0 consequently requires extension and joint-law transport as a reusable API,
with a concrete symmetrization application. It does not promise an unimplemented tactic or
assume that independent copies already live on an arbitrary original probability space.

### Concentration and moment methods are useful entry points

In [what's the status of random matrix theory?](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/what.27s.20the.20status.20of.20random.20matrix.20theory.3F/with/527582998),
Yuxi Liu asks about beginning with Tao's book. Rémy Degenne recommends concentration and
moment methods, describes work on sub-Gaussian MGFs and Hoeffding's lemma, and explains the
then-distributed CLT effort. Kim Morrison points to that effort. Arav Bhattacharyya reports
work on Prokhorov; Josha Dekker offers his tight-measure work for adoption. The thread also
credits Jakob Stiefel, Thomas Zhu, Yoh Tanimoto, Tian Chen, and Sébastien Gouëzel for related
foundations. These are historical acknowledgments, not a statement that those prerequisites
are still missing: the inspected Mathlib contains both the classical CLT and Prokhorov.

Fred Rajasekaran announces the Stanford Wigner project, specifically separating its Dyck-path/
graph moment method from free-probability combinatorics. Edward van de Meent reports a free-CLT
project and, on 2025-07-07, limited progress due to other obligations. We credit that initiative
without describing it as a completed free-probability library or an active claim on the area.

## Existing code and coordination points

### Stanford's semicircle-law project

[Haoyan Jiang, Richard Oh, Fred Rajasekaran, Kiran Sun, and Paul Yoon's SemicircleLaw](https://github.com/FredRaj3/SemicircleLaw)
began as a Stanford SURIM project. Its [blueprint](https://fredraj3.github.io/SemicircleLaw/)
follows the moment-method proof in Todd Kemp's lecture notes. Inspected commit:
[`9f72b2d`](https://github.com/FredRaj3/SemicircleLaw/tree/9f72b2d562583f89b093d05387d942c1ca8c02f4).

Relevant files are `EmpiricalMeasure/Defs.lean`, `RandomMatrix/RandomMatrix.lean`,
`RandomMatrix/WignerMatrix.lean`, `SemicircleDistribution/SemicircleDistribution.lean`, and
`Moments/LoopWalk.lean`. The distribution source develops `semicircleReal` with location and
nonnegative variance, including the Dirac zero-variance case, transformations and moments.
The matrix moment-limit and variance-limit declarations and several loop-walk steps still
contain `sorry`s. This is substantial prior infrastructure and an unfinished Wigner proof,
not a completed semicircle-law theorem. Milestones 1, 3 and 4 should coordinate with this team.

Rajasekaran also describes reusable loop-walk code in the
[December 2025 random-regular-graphs discussion](https://leanprover.zulipchat.com/#narrow/channel/252551-graph-theory/topic/Random.20regular.20graphs.20are.20optimal.20expanders/near/563286461).
The mathematical walk/partition bridge here is a target; the source project's choice of
`LoopWalk` is not a mandatory library design.

### Noncrossing pairings and free probability

- [Wondermonger-daydreaming/semicircle-catalan](https://github.com/Wondermonger-daydreaming/semicircle-catalan),
  inspected at [`95d99de`](https://github.com/Wondermonger-daydreaming/semicircle-catalan/tree/95d99de4490a50af6d909f27e670a82691d6c4e8),
  contains a finite pairing/genus/noncrossing development and Catalan counting. The README
  reports a completed, sorry-free build and identifies `Pairing.genus_zero_iff_noncrossing`
  and `card_noncrossingPairing_eq_catalan`. Its scope is finite combinatorics, not the
  analytic semicircle law. Coordinate on the finite prerequisite and explicitly reconcile
  its recursive noncrossing definition with the four-point crossing criterion.
- Edward van de Meent's free-CLT initiative is documented in the supplied thread and the
  [unital-functional design discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/too.20many.20.60out.60s).
  No public implementation was established for that initiative in this audit.
- [David Buzinski's free-probability repository](https://github.com/dbuzinski/free-probability),
  inspected at [`10edbc3`](https://github.com/dbuzinski/free-probability/tree/10edbc3765ece2d219f1c715b91ec0d070c411b5),
  announces foundations for *Lectures on the Combinatorics of Free Probability*. Its only
  inspected mathematical source is a namespace and a trivial example; it is a coordination
  lead, not an implemented noncommutative-probability API. Buzinski also introduced his
  free-probability/RMT interests on Zulip in August 2026.
- [Dimitri Shlyakhtenko's free-bobkov-hermite](https://github.com/shlyakhtenko/free-bobkov-hermite)
  has a [blueprint and reported results](https://github.com/shlyakhtenko/free-bobkov-hermite/blob/main/lean-blueprint.md)
  involving Hermite roots and the semicircle measure on `[-1,1]`. This is an adjacent
  source for semicircle/Hermite interfaces, not evidence of a general free-CLT library.
  Its support convention requires dilation to the variance-one semicircle on `[-2,2]`.

### PFR and the current probability API

[PFR's independent-copy source](https://github.com/teorth/pfr/blob/master/PFR/Mathlib/Probability/IdentDistrib.lean)
contains `independent_copies` and finite-family variants. Reuse the mathematical interfaces
while checking the current Mathlib `HasLawExists` and `IdentDistribIndep` APIs first.
Mathlib's `exists_hasLaw_indepFun` and `exists_iid` already construct independent realizations;
Milestone 0's added value is preserving the *existing* joint random object and transporting
proofs back through the extension.

The historical [Rémy Degenne CLT repository](https://github.com/RemyDegenne/CLT) is a provenance
source, not the dependency to import. Mathlib's `Probability/CentralLimitTheorem.lean`
credits Thomas Zhu and Etienne Marion; `MeasureTheory/Measure/Prokhorov.lean` credits
Sébastien Gouëzel. The roadmap consumes these existing results.

### StatsMLlib: concentration and matrix estimates

[StatsMLlib](https://github.com/Lean-MoDS/StatsMLlib), inspected at
[`b5893e8`](https://github.com/Lean-MoDS/StatsMLlib/tree/b5893e8dee77cf156638b158d055ffe388fb31c9),
has extensive concentration and matrix code. Inspected concentration sources credit
Yuanhe Zhang, Jason D. Lee, and Fanghui Liu. Relevant components include:

- `Probability/Concentration/`: Bernstein, McDiarmid, Efron–Stein, Hanson–Wright, and
  Gaussian logarithmic-Sobolev tensorization;
- `Probability/Gaussian/LipschitzConcentration.lean`;
- `LinearAlgebra/Matrix/`: Courant–Fischer, interlacing, singular values, perturbation, Lieb;
- `Probability/RandomMatrix/Bernstein.lean`, including a final real symmetric matrix
  Bernstein wrapper from independent bounded centered summands, beyond intermediate
  conditional MGF certificates.

These are direct coordination sources for Milestones 1–2. Review the exact hypotheses,
norms and integrability in each imported theorem; reconcile with Mathlib before reuse.
The mathematical specification here is not a file-by-file port of this repository.

### Brownian motion and stochastic integration

[Rémy Degenne and collaborators' Brownian-motion project](https://github.com/RemyDegenne/brownian-motion)
and the [paper by Degenne, David Ledvinka, Etienne Marion, and Peter Pfaffelhuber](https://arxiv.org/abs/2511.20118)
provide the Brownian construction behind the Mathlib foundation. The repository also has
`BrownianMotion/StochasticIntegral/` sources for simple processes, L² martingales, quadratic
variation, Doob–Meyer, and stochastic integration. Their presence does not certify a completed
Itô formula or SDE existence theorem.

The [second-phase discussion](https://leanprover.zulipchat.com/#narrow/channel/509433-Brownian-motion/topic/Second.20phase.20of.20the.20project)
records the stochastic-integration effort, including Yongxi Lin (Aaron), Kexing Ying,
Lorenzo Luccioli, Alessio Rondelli, and Pietro Monticone. Milestone 10 must coordinate with
this work, use its agreed designs, and supply any missing theorems in Tau Ceti.

## Mathlib source and PR audit

The initial Mathlib source survey used
[`05ae010`](https://github.com/leanprover-community/mathlib4/tree/05ae0103f49b1ad1248f6039bbbad43d8aeb52a9).
The initial full build used Mathlib
[`e21ec05`](https://github.com/leanprover-community/mathlib4/tree/e21ec05048292b3de86d4cf1987e2208171a5642)
and Tau Ceti
[`43531f6`](https://github.com/TauCetiProject/TauCeti/tree/43531f6347feb638a6299785316d6e1d32b74b2c).
The PR target signatures are checked against upstream main’s manifest pins: Mathlib
[`2b1308e`](https://github.com/leanprover-community/mathlib4/tree/2b1308ee396f215169fdaa6807ea1d0f91d0001f)
and Tau Ceti
[`be0b30f`](https://github.com/TauCetiProject/TauCeti/tree/be0b30f3963c7f5158674dca96d7fe3fdd0dcd20).
The searched subjects included random matrices, semicircle laws, free probability,
noncrossing partitions, empirical measures, transforms, eigenvalues, concentration,
sub-Gaussian variables, singular values and Brownian/Itô theory. Search results are not
an exhaustive proof of absence.

| Work | Observation and consequence |
| --- | --- |
| [#37245, resolvent transform](https://github.com/leanprover-community/mathlib4/pull/37245) | David Ledvinka's definition and analytic API are present in the pinned Mathlib. Use `resolventTransform`, including its actual sign convention. |
| [#43642, finite moment expansion](https://github.com/leanprover-community/mathlib4/pull/43642) | Open; exact finite expansion with an integral remainder. Milestone 3 follows this interface direction. |
| [#39165, sub-exponential variables](https://github.com/leanprover-community/mathlib4/pull/39165) | Allen Hao Zhu's open PR; the inspected definition does not bundle exponential integrability, so tail applications must supply it. |
| [#7427, eigenvalue ordering](https://github.com/leanprover-community/mathlib4/pull/7427) | An open historical ordering proposal. The inspected Mathlib already has decreasing `eigenvalues₀`; consume the implementation, not an obsolete missing-feature claim. |
| [#39139, Schur triangulation](https://github.com/leanprover-community/mathlib4/pull/39139) | Open and relevant to complex Ginibre change of variables. Build the required compatible Schur result here if absent from the dependency. |
| [#32126, operator singular values](https://github.com/leanprover-community/mathlib4/pull/32126) | Open operator-level work. Finite-dimensional singular values already exist in Mathlib; avoid conflating these scopes. |
| [#12394, pre-tight/tight measures](https://github.com/leanprover-community/mathlib4/pull/12394) | Historical work offered for adoption in the linked discussion. Current tightness and Prokhorov APIs supersede any claim that those definitions are unavailable. |

No external code has been copied into this roadmap, and no author contact or agreement is
claimed. The coordination points above acknowledge both implemented material and announced
projects while keeping their different levels of completion explicit.
