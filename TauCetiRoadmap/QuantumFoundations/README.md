# Mathematical foundations of quantum systems

Develop the mathematical interface between operational quantum models and Hilbert-space
quantum mechanics: states, questions, measurements, outcome laws, composition, entanglement,
statistics, and symmetry. A quantum postulate is data or a hypothesis of a model in this
roadmap, never a theorem about all mathematical systems. The targets below give finite models
and infinite-dimensional Hilbert-space models the same explicit probability semantics.

The inner product is conjugate-linear in its first variable. Complex Hilbert spaces are used
for ordinary quantum systems. A normalized vector `ψ` determines the vector state
`A ↦ ⟪ψ,Aψ⟫`; its ray determines that state independently of phase. For a
self-adjoint observable `A`, the outcome law in state `ψ` is
`B ↦ ‖P_A(B)ψ‖²`, where `P_A` is its real spectral PVM. For a normal state represented by a
positive trace-class operator `ρ` with `Tr ρ = 1`, it is `B ↦ Tr(ρ P_A(B))`. These are
probability measures on the Borel sets of `ℝ`. In finite discrete measurements the same
definition gives `p_i = Tr(ρ E_i)` for a finite PVM `(E_i)` summing to `1`.

This roadmap consumes Mathlib's complex Hilbert spaces, orthogonal projections, finite matrix
positivity, measures, and continuous functional calculus. It consumes
[SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) for
`LinearPMap`, domains, self-adjointness, Stone's theorem, bounded Borel calculus, and the
unbounded self-adjoint spectral PVM with its domain-preserving projections. It consumes
[VonNeumannAlgebras V10.ClosedOperators](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dee80881a8383ef144a2340215781681d06590df/TauCetiRoadmap/VonNeumannAlgebras/README.md#layer-10-affiliated-operators-and-tomitatakesaki-theory)
for the multiplier-form representation of an arbitrary self-adjoint operator, including its
square-integrability domain. QF consumes the exact unbounded Borel functional calculus and operator-domain laws in the
OperatorTheory/UnboundedOperators dependency contract below. It does not define a competing
spectral-PVM carrier.
It uses Mathlib's implemented positive-functional GNS API and consumes
[VonNeumannAlgebras V0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/dee80881a8383ef144a2340215781681d06590df/TauCetiRoadmap/VonNeumannAlgebras/README.md#layer-0-c-algebra-and-state-prerequisites)
for the shared normalized positive-functional state carrier and GNS construction. It consumes
[CStarAlgebras C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1d4e2ed5c7523dc9d5dbb9f712f266a8ed661660/TauCetiRoadmap/CStarAlgebras/README.md#c2-irreducible-representations-primitive-ideals-and-the-bidual)
for pure-state/extreme-point and irreducible-GNS consequences, C4 for generic CP maps and
Stinespring dilation, and C5 for spatial C*-tensor products. QF depends on the carriers and hypotheses specified by these CStarAlgebras milestones. It consumes
[OperatorAlgebraDynamics D8](../OperatorAlgebraDynamics/README.md#d8-car-weyl-algebras-and-free-equilibrium-states)
for CAR and Weyl algebras, regular representations and fermionic/bosonic Fock carriers. QF adds
operational state and outcome semantics and develops its generic Fock-operator/domain API on those carriers; D8 owns the CCR/CAR/Weyl algebras and basic field operators, while UO owns generic unbounded-domain and spectral theorems. QF does not define another CCR/CAR algebra. It consumes
[RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) for
compact continuous unitary representations and Peter–Weyl. Consume
[SpinRepresentations Layer 7](../RepresentationTheory/SpinRepresentations/README.md#layer-7-real-clifford-algebras-bott-periodicity-and-spinp-q)
for real Clifford classification and Bott periodicity, LieHighestWeight Layer 5 for
complete reducibility, LieGroups Layers 4–5 for integration and simply connected covers, and Layer 2 for closed-subgroup and automatic-smoothness results,
LieGroupoidsPoisson G1.3 for the point Chevalley–Eilenberg calculus, AlgebraicTopology
for covering/fundamental-group comparisons, and PDE for the Euclidean Sobolev and
weak-derivative domains specified in the particle models. The
Hilbert-space mechanisms in QF do not imply spin-statistics. RelativisticQuantumFieldTheory (RQFT) consumes QF4's generic Fock and second-quantization API at RQFT2/RQFT3/RQFT10 to build free fields; RQFT3 owns free operator-valued fields, RQFT4 owns Wightman/Haag–Kastler models and spin-statistics under its hypotheses, RQFT5 owns formal graph combinatorics, RQFT6 distribution-valued realization, extensions and renormalization, and RQFT7 Euclidean continuation, RQFT8 owns scattering, and RQFT10 owns the bosonic Shale criterion in the regular Fock representation. RQFT0–4 and RQFT10 have no dependency on terminal QF6b. The QF-to-RQFT edges are QF6a→RQFT0, QF4→RQFT2/RQFT3/RQFT10, QF5→RQFT6, and QF6b→RQFT9; there is no RQFT-to-QF dependency into QF0–QF5 or QF6a. QF6b is the terminal source-application milestone: it consumes RQFT3's physical photon one-particle space for Dooley p.15's Maxwell model, and D8's symmetric Fock carrier with QF4's second-quantization API. It identifies the positive-particle subrepresentation `⊕_{n≥1} Sym^n(H₁)` but does not assign field operators to that non-vacuum subspace; a field acts on the named full RQFT3 carrier. QF6b also consumes RQFT10 for the stated free-representation comparison. QF6b records but does not prove the course-note spin-statistics claim; RQFT4 remains the sole owner of that theorem under its hypotheses. RQFT0–4 and RQFT10 do not consume QF6b. RQFT9 consumes QF6b’s nonrelativistic Coulomb comparison and shared all-parameter Kummer M/U analytic interface downstream, with no reverse QF6b input from RQFT9. RQFT2/3/10 consume QF4's Fock interface; this dependency direction makes the QF6b source-application edge acyclic.
The shared interfaces have the following dependency order. QF1's operational,
logic and Hilbertization constructions precede the state/probability uses in
QF2–QF4. QF5 consumes those completed logic carriers and owns the
logic-symmetry classifier. QF0 supplies QF5's algebraic ray theorem, while QF1 supplies the operational orthogonality and logic carriers consumed there.
QF3/QF4 and the standalone free-particle QF6a use no field construction.
QF0/QF1/QF5→NQS M1; QF5.P→NQS M1/M2/M5; QF5→NQS M3/M4/M6; QF4→NQS M6; QF6a→NQS M3 and RQFT0;
QF4→RQFT2/RQFT3/RQFT10; QF5→RQFT6→RQFT9; NQS M2/M4→RQFT2/RQFT3; NQS M4→RQFT11;
RQFT0–3→RQFT4; NQS M0–M6 plus RQFT3/RQFT10→QF6b→RQFT9’s Coulomb comparison.
RQFT9 owns electromagnetic and perturbative-QED examples; it is not a generic
QF prerequisite. The source applications in QF6b follow all their named inputs.

The general-logic additions are terminal submilestones with explicit inputs.
QF1.G owns elementary operational actions and MO_n; it has no V12.J input.
Its VNA-model-boundary example consumes V2/V3/V4.Normality/V5 for projection corners
and normal supports, without making those terminal example inputs prerequisites
of the earlier QF1 operational axioms or QF2.Frame.
QF2.Frame is the finite complex frame-function theorem and
QF2.ElementaryBloch supplies its elementary dimension-two examples and boundaries; neither consumes
V5.LatticeFinite, V6.LatticeTypes or V12.J. QF2.GeneralGleasonAndDensity separately consumes QF2.Frame, V4.Normality and the spectral/trace suppliers named at its statement; it is not a QF5 input. QF2's elementary nonmodularity
comparison consumes V2.NonmodularProjectionLattice; its general finite-algebra
modularity comparison consumes V5.LatticeFinite separately from QF2.Frame.
QF3.G.Model consumes V0/V1/V2, V4.Core/V4.PositivePredual/V4.Normality
and V10.Affiliation's pre-tracial PVM
comparison, with V10.ClosedOperators supplying its polar/domain machinery;
QF3.G.Type consumes V3/V5/V6. QF3.G.TypeExamples consumes QF3.G.Model,
QF3.G.Type, V6, V8, V10, V11 and V13 for its named examples and
classification comparisons. V4.PositivePredual has no QF input.
V12.J.Scalar consumes QF2.Frame, V0–V6 and V4.PositivePredual.
V12.J.Dye’s lattice-I₂ transport consumes V6.LatticeTypes. V12.J.Maps is
the normal Jordan-map API consumed by Dye, Enriched and CentralSplitting.
V12.J.Enriched consumes V4.PositivePredual and the spectral/
projection carriers, independently of the scalar no-I₂ theorem.
QF3.G.ProjectionStates consumes V12.J.Scalar; QF5.G.Presentation and its
full-model operational action consume V12.J.Enriched and QF3.G.Model.
QF5.G's implementation consumes V11; QF3.G.StateGeometry consumes its own
JB/JBW reconstruction and the named VNA inputs. QF3.G.ConeComparison is a
separate terminal comparison consuming QF3.G.StateGeometry, V4.PositivePredual
and V11's standard form and bounded-derivation innerness; earlier reconstruction does not consume
this cone comparison. Existing QF1/QF5 consumers
in NQS and RQFT consume the earlier operational/Hilbert, ray, projective-group
and QF5.P parts only, unless they explicitly name a terminal .G theorem.
There is no blanket inheritance of all .G inputs by those earlier interfaces.
The roadmap-level QF↔VNA references therefore have this acyclic milestone
ordering; no V0–V6 construction depends on the V12.J application.


The trace-class carrier and norm come from OperatorTheory/OperatorIdeals Part B, and its
normal-functional pairing from VonNeumannAlgebras V4.Core. Hilbert tensor products come from
VonNeumannAlgebras V2; spatial C*-tensor products come from CStarAlgebras C5. Hilbert-module interior tensor products, where a representation is induced,
come from HilbertModules H3. These are distinct carriers and must not be silently identified.

## Conventions and model boundary

A **quantum model** consists of a specified unital C*-algebra `A`, a unital *-representation
`π : A → B(H)` on a complex Hilbert space, a specified subset of states on `A`, selected effects
in `B(H)`, measurable outcome spaces with POVMs in `B(H)`, and chosen dynamics and symmetries.
For every selected state φ evaluated on represented effects require φ to vanish on ker π.
Construct its factored state φ_π on π(A), prove φ=φ_π∘π and uniqueness,
and evaluate E=π(a) by φ_π(E)=φ(a), independently of its lift. Prove the
factorization/ker-annihilation equivalence; π need not be faithful.
For effects in B(H) outside π(A), include a chosen state extension φ̃ of φ_π
and evaluate them by φ̃(E), retaining agreement on represented effects.
Require φ̃ to be normal whenever outcome laws use a weak-operator-countably
additive POVM, or state an alternative hypothesis actually implying countable
additivity of S↦φ̃(E(S)). State which algebra carries each Heisenberg map and require compatibility with `π`; do not infer normality or countable additivity from an arbitrary state extension. Spectral projections of unbounded observables may lie
outside `π(A)`. State evolution is the dual action of the selected Heisenberg
maps. A symmetry `g` is represented
by a unitary or antiunitary ray action `U_g` with a parity homomorphism
`ε : G → {0,1}`; require a compatible map `α_g:A→A` satisfying
`π(α_g(a))=U_g π(a) U_g⁻¹`. The map `α_g` is a *-automorphism when `ε(g)=0` and a
conjugate-linear *-automorphism when `ε(g)=1`. For a state φ define its transported state by
`φ_g(a)=conj^(ε(g))(φ(α_g⁻¹(a)))`, where `conj^0=id` and `conj^1` is complex conjugation.
QF1 proves complex linearity, positivity, normalization, the composition law and covariance of
outcome probabilities; the conjugation is required when α_g is conjugate-linear.
Apply the same formula to the specified compatible state extension on `B(H)`.
State the compatible group composition law and
transport event effects by `E(gS)=U_g E(S)U_g⁻¹` whenever `g` acts on the outcome space.
Whenever dynamics or symmetry acts only on a selected subcollection, that subcollection and its
closure conditions are part of the model data. The mathematical interface does not assert that
every physical system has this model. An effect is a bounded self-adjoint operator `E` with
`0 ≤ E ≤ 1`; a finite
measurement is a finite family of effects summing to `1` (a POVM), and a sharp measurement is
a finite PVM whose distinct values are orthogonal projections. Outcomes and their measurable
space are part of the measurement data. A general POVM need not be a PVM or arise from a
self-adjoint operator on the same Hilbert space.

Consume the normalized positive-functional state carrier and convex operations from
VonNeumannAlgebras V0; use CStarAlgebras C2 for pure-state consequences; do not define a competing state type. In a general
infinite-dimensional state space, do not assert every state is a countable convex sum of pure
states: use the weak-star closed convex-hull theorem from the C*-state supplier. Pure states
are extreme points of this convex state space. QF1 proves finite convex mixing and norm-convergent
countable mixing of normal states represented by trace-class operators; for arbitrary C*-states
state the weak-star closed convex-hull theorem, not a countable decomposition assertion. Define
strongly convex families and full families in the abstract logic milestone and prove closure under
the specified mixtures. A vector state is a state obtained from a unit
vector in a representation; its ray determines that state independent of phase. A vector
state is pure exactly when its cyclic GNS representation is irreducible. For `B(H)`, every
unit-vector state is pure. QF1 proves for pure normal states on `B(H)` conversely that equality of their vector-state functionals implies the vectors define the same ray. A density operator
describes a **normal** state on `B(H)`, not every state on an infinite-dimensional `B(H)`.
In finite dimension every state is a density matrix. QF2.GeneralGleasonAndDensity derives the normal-state eigen-decomposition from the compact spectral and trace-class suppliers named there. Keep this normal-state theorem distinct from
Gleason's theorem and from statements about arbitrary, possibly nonnormal states.

Use `U(t)=exp(itA)` for Stone generators and `U(g)U(h)=ω(g,h)U(gh)` for a projective
unitary representation obtained from a normalized Borel unitary lift, with normalized
Borel multiplier `ω`; Borel phase changes give Borel coboundaries. For the locally
continuous extension convention use the local conditions in QF5. A global continuous
lift gives a continuous multiplier and continuous phase changes give continuous
coboundaries; existence of such a lift is a separate hypothesis. A symmetry of pure states acts on rays and preserves
transition probabilities. The Wigner–Uhlhorn conclusion is stated only under its exact
complex Hilbert-space dimension and bijectivity hypotheses, with unitary and antiunitary
alternatives distinguished. Continuity of a ray action, continuity of a chosen lift, and
continuity of its multiplier are separate conditions.

## Shared prerequisite QF0 — projective geometry of subspace lattices

Consume Mathlib's `Projectivization` carrier where applicable and identify its points with
one-dimensional subspaces. For either field `𝕂=ℝ` or `𝕂=ℂ`, and `𝕂`-vector spaces `V,W`
of dimension at least three, prove that every bijection `P(V)≃P(W)` taking projective
lines onto projective lines is induced by a semilinear equivalence
`S:V≃ₛₗ[σ]W`, for a field automorphism σ of 𝕂. Prove the converse. The
inducing pair is unique in the sense that its field automorphism is fixed and its
semilinear map is unique up to multiplication by a nonzero scalar. This is an
algebraic theorem for finite or infinite algebraic dimension and supplies no
continuity. For ℝ, prove σ=id: automorphisms preserve nonnegative squares,
hence order, and rational density forces every real number fixed. In the Banach
application QF1 defines the actual point map into the continuous dual, distinct
from the full algebraic dual. The projective theorem supplies neither boundedness
nor Hilbert structure. QF5 uses its complex case for the collineation induced by
a ray map.

## Milestone QF1 — operational systems, questions and probability

Use the following explicit operational and Mackey-logic interfaces. An operational
system has states `S`, real-valued observables `O`, and numbers
`p(A,α,E)∈[0,1]` for `A∈O`, `α∈S` and Borel `E⊆ℝ`. Here are the
six source-facing axioms, with the adopted question correction below kept separate.

- **(a), outcome laws:** `p(A,α,∅)=0`, `p(A,α,ℝ)=1` and
  `p(A,α,⋃ᵢEᵢ)=Σᵢp(A,α,Eᵢ)` for every countable disjoint Borel family.
- **(b), separation:** equality of `p(A,α,E)` and `p(B,α,E)` for every `α,E`
  implies `A=B`; equality of `p(A,α,E)` and `p(A,β,E)` for every `A,E`
  implies `α=β`. Both quantifier directions are part of the interface.
- **(c), Borel functions:** for every Borel `f:ℝ→ℝ` and `A∈O`, there is
  `f(A)∈O` with `p(f(A),α,E)=p(A,α,f⁻¹(E))` for every `α,E`.
  It is unique by (b). Prove identity and composition by their pushforward
  laws; constant functions give constant observables. This supplies `A²`
  and `1−Q`, without defining `A+B` for unrelated observables.
- **(d), countable mixing:** for every `αᵢ∈S` and real `tᵢ≥0` with
  `Σᵢtᵢ=1`, there is `α∈S` satisfying
  `p(A,α,E)=Σᵢtᵢp(A,αᵢ,E)` for every `A,E`; it is unique by (b).
  The nonnegative-series interpretation is the adopted convex convention.
- **(e), orthogonal joins:** on the corrected questions defined below set
  `q≤r ↔ ∀α, p(q,α,{1})≤p(r,α,{1})`, and set `q′=(1−id)(q)`.
  For every countable pairwise orthogonal family `qᵢ≤qⱼ′` (`i≠j`),
  require its least upper bound in this order. The printed (e) records this
  order property; it does not explicitly state probability additivity at
  that join. Do not replace its join by an unrestricted sum of observables.
- **(f), realization:** for every normalized question-valued Borel measure
  `E↦L_E` on `ℝ`, there is `A∈O` with `χ_E(A)=L_E` for every Borel `E`.
  Here “question-valued measure” means `L_∅=0`, `L_ℝ=1`, disjoint events
  have orthogonal values, and `L_(⋃ᵢEᵢ)=⋁ᵢL_(Eᵢ)` for countable
  disjoint Borel families. This definition uses the logic structure in the
  next paragraph, rather than assuming that it follows from (b) alone.

For a definitive adopted Mackey model, require that the corrected question
order and `q′` form a nontrivial orthomodular poset with countable orthogonal
joins, with `0,1` the constant questions. This is the explicit structural
bridge in the operational-to-logic direction, supplied by the Hilbert/
projection models below. Prove evaluation additivity from (a), (c) and
(f), rather than adding it as another bridge premise. For any pairwise
orthogonal `q_n`, put `q=⋁_n q_n`, `r_0=q′` and `r_(n+1)=q_n`.
For Borel `E⊆ℝ`, define `L_E=⋁{r_k:(k:ℝ)∈E}`, using `0` for the
empty selected family. These are countable orthogonal joins. Prove that
subjoins for disjoint index sets are orthogonal by order reversal, and
that regrouping subjoins gives the join of the union by the least-upper-
bound property. Thus `L` is a normalized question-valued Borel measure,
with `L_ℝ=q′∨q=1`, without using scalar evaluation additivity.
Use (f) to realize `L_E=χ_E(A)`, and (c) to obtain
`m_α(L_E)=p(A,α,E)` for `m_α(a)=p(a,α,{1})`.
Apply (a) to the disjoint singleton events `{n+1}` to get
`m_α(q)=Σ_n m_α(q_n)`. Constants give `m_α(0)=0`, `m_α(1)=1`.
Consequently each evaluation is a countably additive logic probability.
The source's attribution of this conclusion to (b) alone remains a proof
qualification: the adopted argument uses (a), (c), (f) and the explicit
logic structure, not separation alone. The abstract logic carrier and its
probability states here precede the V0 representation adapters; in those
adapters consume V0's existing states.

Prove the exact two presentations of this adopted model. Starting instead
with a nontrivial orthomodular poset `L` with countable orthogonal joins and
a nonempty full, countably convex family `J` of countably additive logic
probabilities, take `S=J`, take `O` to be **all** normalized `L`-valued
Borel measures on `ℝ`, and define `p(A,m,E)=m(A(E))`. For `a∈L` the binary
observable is `A_a(E)=⋁({a:1∈E}∪{a′:0∈E})`, with empty join `0`;
only this two-element orthogonal join is involved. Fullness identifies
`a` with this question and identifies the question order with that of `L`.
Use these binary observables to prove state separation. Use fullness to
prove observable separation; use measure pushforward for (c), the selected
family's countable convex closure for (d), and the logic's joins for (e).
For (f) use the given measure itself as an observable. Prove the binary
support criterion identifies every operational question with precisely one
`a∈L`, so there is no extra question carrier. All statements about this
normalized-state presentation require the stated nonempty `J`; a zero
Hilbert space has no normalized states and is not silently given one.

In the other direction, from the operational axioms plus the adopted bridge,
put `q_E^A=χ_E(A)`. By (c),
`m_α(q_E^A)=p(A,α,E)`. Scalar additivity gives orthogonality for disjoint
`E,F`, since `m_α(q_E^A)≤1−m_α(q_F^A)=m_α((q_F^A)′)` for every `α`.
For a disjoint countable family, apply the just-derived evaluation
additivity to its orthogonal join and (a) to its union. Equality in every `m_α`, then
fullness of the question order, identifies that join with `q_(⋃ᵢEᵢ)^A`.
Thus `E↦q_E^A` is a normalized logic-valued measure.
**Principle II:** `A↦(E↦q_E^A)` is a bijection from `O` to all these
measures: (f) gives surjectivity, and the displayed probability identity
and (b) give injectivity. **Principle III:** `α↦m_α` is a bijection from
`S` onto its image `J`; injectivity follows from Principle II's event
probabilities and (b), countable convex closure from (d), and fullness
from the definition of the question order. This claims a selected full
family, not every probability measure on `L`. Prove the reconstruction
`p(A,α,E)=m_α(q_E^A)` and that these two presentations are inverse up to
the specified state, question and observable bijections.

**Principle IV, source model:** a question-logic isomorphism with all
orthogonal projections of `B(H)`, equivalently all closed subspaces of a
nonzero complex separable Hilbert space `H`, preserving order, complement
and countable orthogonal joins. This is an extra Hilbert-model postulate,
not a consequence of (a)–(f). Later arbitrary-cardinality Hilbert results
remain in their stated scope, and QF2 keeps its dimension-two and real
Gleason exceptions. **Principle IV′, adopted VNA realization:** for a
nonzero complex Hilbert space `H` and a unital weak-operator-closed complex
*-subalgebra `M⊆B(H)`, use `L=P(M)` and the projection-lattice embedding
`P(M)↪P(B(H))`, preserving complements and arbitrary joins/meets.
This supplies models of the source's sublattice alternative; no converse
claim that every abstract sublattice is the projection lattice of such an
`M` is made without additional hypotheses. Retain the source's literal
weaker “isomorphic to a sublattice” sentence separately. The weak-density
and type-II corrections in QF2 remain in force. For the classical Boolean
phase-space model, take a nonempty measurable space `(Ω,Σ)`, `L=Σ`, all
countably additive probability measures as `J` (including Dirac measures,
so `J` is full), and all measurable real functions as observables.
Their preimage measures give the same operational probabilities; prove the
converse realization of a `Σ`-valued real Borel measure by the measurable
function reconstructed from its rational sublevel sets. This Boolean
example does not restrict the later noncommutative models.

Preserve the exact recorded qualifications on Dooley pp.3–7: the
parenthetical abbreviation after the logic-measure normalization is faint;
(c), (d) and (f) are transcribed with existential/implication arrows,
where the adopted clauses above explicitly assert witnesses satisfying
the displayed laws. The literal (d) leaves the sign convention implicit;
the adopted weights are nonnegative, including zero. The parenthetical
“at least one of these = 1” after (e)'s join is not used as an axiom that
some `qᵢ=1`; that assertion fails, for example, for two complementary
nontrivial projections (and for the all-zero family). The physical gloss,
the “equipped with” phrase, the cut-off objection to IV and the Boolean
continuation remain uncertain or incomplete. No unread glyph is supplied.
The literal all-events question predicate and the corrected support
predicate are separately retained below.

The orthocomplemented-poset and probability-state conventions are the following. The orthocomplemented-poset axiom (v) says: if `a≤b`, there is `c≤a′` with `a∨c=b`, uniquely `c=(a∨b′)′`. Adopt countable convex closure as the strongly-convex-family convention: for `m_i∈J` and `t_i≥0` with `Σ_i t_i=1`, the pointwise measure `a↦Σ_i t_i m_i(a)` belongs to `J`; prove convergence, countable additivity by nonnegative sum interchange, and closure under iterated mixtures. The source writes `t_i∈ℝ⁺` without fixing whether zero is included; record that literal convention separately. Define fullness by `((∀m∈J, m(a)≤m(b))→a≤b)`, and prove the state-family order embedding and its Hilbert projection realization. Preserve Dooley p.5's literal predicate
`∀α ∀E, p(Q,α,E)∈{0,1}`, with the handwritten quantifier over states `α` and Borel events `E`; the source does not say `p(Q,α,{0,1})=1`.
In the Hilbert model this is not the projection criterion: for
`Q=diag(1,0)` and `ρ=I/2`, the event `{1}` has probability `1/2`.
Adopt the corrected definition of a question as
`∀α, p(Q,α,{0,1})=1`. It says that every outcome law is supported on `{0,1}`,
and is a property of `Q`, independent of a chosen state. The source's additional literal claim `Q` is a question iff `Q²=Q` is false for this all-events predicate in both directions: a nontrivial projection fails it in the mixed state `I/2`, while `Q=2I` satisfies the all-events 0/1 condition but is not idempotent. Define the associated question/effect-algebra operations explicitly. In this Hilbert-model criterion, `α` ranges over all normal states.
For self-adjoint `Q`, prove the corrected support criterion equivalent to `Q` being an orthogonal projection. In the abstract system, axiom (c)'s functional-calculus law makes `Q` and `Q²` have the same outcome distributions because `x²=x` on `{0,1}`; axiom (b)'s separation of observables then gives `Q²=Q`. Conversely, use spectral calculus for a self-adjoint idempotent to prove support on `{0,1}`. Also record the literal all-events predicate separately: a probability measure taking only values 0 and 1 on every Borel set is a point mass, so its point can be any real number; hence `2I` satisfies that predicate, while a nontrivial projection fails it in state `I/2`. For the abstract converse from `Q²=Q`, use axiom (c) to get equality of the outcome law of `Q` and `Q²`; the law is invariant under `x↦x²`. Prove the support claim directly for a squaring-invariant Borel probability `μ`: its negative half-line has measure zero because the square map has no negative values. For `r≥0`, let `F(r)=μ([0,r])`; invariance gives `F(r)=F(√r)`. For `0<r<1`, iterating square roots and continuity from below gives `F(r)=μ([0,1))`, and then `r↓0` gives `μ((0,1))=0`. For `r>1`, iteration and continuity from above gives `F(r)=μ([0,1])`; taking `r↑∞` gives `μ([0,1])=1`. Thus `μ({0,1})=1`. Own these distribution-function steps as part of the abstract converse rather than assuming a dynamical recurrence theorem. This is operator composition, distinct from partial effect addition. Keep literal axioms and corrected model theorems separately identified. Prove the adopted operational/logic equivalence, Principles II/III and IV/IV′ model comparisons under the exact bridge and nonempty-state hypotheses above; retain the source's derivation claim separately from those hypotheses. QF1.S below specifies the Segal/Mackey comparison and its selected-state hypotheses; QF1.P gives the precise product-space contracts. Keep the literal historical claims separate from these adopted theorems. State the
Kakutani–Mackey Hilbertization theorem with its exact hypotheses and prove the orthomodular law
and compatibility with the projection model. Its ordinary quantum case is the following complex
theorem. Let `B` be an infinite-dimensional complex Banach space and `L(B)` its lattice of all
closed complex linear subspaces. Suppose a bijection `X ↦ X⊥` of `L(B)` satisfies, for all `X,Y`,
`X⊆Y → Y⊥⊆X⊥`, `(X⊥)⊥=X`, and `X∩X⊥={0}`. Then there is a complex inner product on the same
vector space `B`, complete in its induced norm, such that the induced Hilbert norm and original
Banach norm give the same topology and its orthogonal complement of every `X` is exactly `X⊥`.
This is topological equivalence, not equality of the given norm with an inner-product norm. The map on subspaces is an order-reversing correlation: it sends one-dimensional subspaces to
closed hyperplanes, not atoms to atoms. For the complex theorem, do not confuse lattice double-complement `(X⊥)⊥=X` with Banach
reflexivity `B≃B**`. Define the actual point map
`κ : P(B) → P(B*)`, `κ(ℂx) = ((ℂx)⊥)⁰`, where `⁰` is the annihilator in the continuous dual.
The complement of a line is a closed hyperplane, so this annihilator is a point of `P(B*)`.
Use the lattice incidence and double-complement laws to prove that κ is a bijective
line-preserving map, then apply QF0's cross-space projective theorem to obtain a semilinear
bijection `S:B→B*`; no continuity follows from this algebraic step. Prove the exact image formula
`S(X)=(X⊥)⁰` for every closed subspace X. The forward inclusion follows from
`X⊥⊆(ℂx)⊥=ker(Sx)` for x∈X; conversely, write a nonzero functional in `(X⊥)⁰` as a scalar
multiple of `Sx` and apply the order-reversing involution to
`X⊥⊆(ℂx)⊥`. Thus S sends every closed hyperplane to a closed hyperplane.

Own the following one-way hyperplane automatic-continuity lemma, rather than assuming that S⁻¹
preserves arbitrary hyperplanes: for infinite-dimensional complex Banach spaces X,Y, a bijective
σ-semilinear map E:X→Y that sends every closed hyperplane of X to a closed hyperplane of Y has
σ=id or conjugation and E,E⁻¹ bounded. Construct normalized biorthogonal pairs
`f_n(x_m)=δ_nm` inductively by choosing each unit x_n in the finite intersection of previous
kernels and applying Hahn–Banach to the previous finite span. For each n, let g_n be the
continuous functional with kernel E(ker f_n) and `g_n(Ex_n)=1`; then
`g_n(Ex)=σ(f_n(x))`. If σ is discontinuous it is unbounded on every neighborhood, so choose
`|λ_n|≤2⁻ⁿ` with `|σ(λ_n)|>n‖g_n‖`. The convergent series `x=Σλ_nx_n` gives
`f_n(x)=λ_n` and contradicts `|g_n(Ex)|≤‖g_n‖‖Ex‖` for all n. Continuity of σ implies it fixes
ℝ by density of ℚ and sends i to ±i. For boundedness, for each f∈X*, `f∘E⁻¹` has closed
hyperplane kernel E(ker f), hence is continuous through the one-dimensional Banach quotient.
Testing a convergent graph sequence against every f proves E⁻¹ has closed graph; the closed
graph and inverse mapping theorems give boundedness of E⁻¹ and E. This uses completeness of X,Y
and does not assume B≃B**.

Set `h(x,y)=(Sx)(y)` using the chosen dual convention. The lattice polarity gives
`h(x,y)=0 ↔ h(y,x)=0`; prove the corresponding reflexive-form lemma and its transpose or
adjoint proportionality. In the linear case, transposing twice yields symmetric or alternating
bilinear type; alternating type has zero diagonal, while a nondegenerate symmetric complex
bilinear form in dimension at least two has a nonzero isotropic vector. Either contradicts
`X∩X⊥={0}`. Thus σ is conjugation. In the conjugate-linear case, prove `h*=c h`, `|c|=1`,
rescale by a phase to make h Hermitian, and use continuity plus connectedness of the complex unit
sphere to show its nonzero diagonal has constant sign; change sign if needed to obtain positivity.
With `C=‖S‖`, `D=‖S⁻¹‖`, prove the equivalent-norm bounds
`‖x‖_h≤√C‖x‖_B`, `‖Sx‖_(B*)≤√C‖x‖_h`, and
`‖x‖_B≤D√C‖x‖_h`. This gives completeness and identifies the prescribed complement with
h-orthogonality. Keep each lattice, annihilator, form, and continuity lemma's hypotheses explicit.

For a real Banach space `B` of dimension at least three, prove the prescribed-complement
version with the same lattice hypotheses: every order-reversing involution of its
closed-subspace lattice with `X∩X⊥={0}` is the orthogonal-complement operation of
an equivalent complete real inner-product norm. This includes both finite and
infinite dimension. Use `κ(ℝx)=((ℝx)⊥)⁰` in the continuous real dual, prove the
same incidence and image formulas, and apply QF0 over ℝ. Its automorphism is
identity, so the resulting `S:B→B*` is real-linear. In infinite dimension use
the real closed-hyperplane continuity argument: for each continuous f, the
functional `f∘S⁻¹` has a closed hyperplane kernel and is therefore continuous;
apply the closed graph and inverse mapping theorems. In finite dimension S and
its inverse are continuous by the finite-dimensional normed-space theorem.
The reflexive bilinear form `h(x,y)=(Sx)(y)` is symmetric or alternating;
nonzero diagonals exclude the alternating case. Continuity on the connected
unit sphere shows the nonzero diagonal has constant sign. Rescale by a sign
to obtain a positive definite form. Prove the same equivalent-norm estimates
with `C=‖S‖` and `D=‖S⁻¹‖`, giving completeness and the prescribed complement.

Also prove the finite-dimensional existence statement in every dimension:
any finite-dimensional real Banach space admits an equivalent complete Euclidean
norm. Choose a finite basis, pull back the standard inner product on ℝⁿ, and
use finite-dimensional norm equivalence. Thus, in dimensions zero, one and two,
the existence of an order-reversing involution with disjoint complements is
equivalent to existence of some equivalent Hilbert realization: in the reverse
direction use that realization's orthogonal complements. For dimension at least
three the stronger result above realizes the specified involution. In dimensions
zero and one the lattice operation is unique and is realized too. Distinguish
this existence statement from prescribed-complement realization in dimension two,
where the latter does not hold for every such involution.

Quaternionic Hilbert logic is a separate model target: define a right quaternionic Hilbert space, closed right-linear subspaces, right-Hermitian orthocomplementation, orthogonal projections and the projection-lattice probability semantics; prove the corresponding orthomodular and countable-orthogonal-sum laws. Dooley p.8 discusses quaternionic Hilbert spaces and separately a Banach-space Hilbertization theorem without an explicit field qualification. These sentences do not assert a quaternionic Banach Hilbertization theorem. Preserve their literal wording separately; the exact real and complex Banach theorems above and the quaternionic Hilbert-model development are the adopted contracts. Define group actions by logic automorphisms.
These are model definitions and reconstruction targets, not claims that physical postulates are
universal mathematical facts.

Use the normalized positive-functional state carrier, affine structure and GNS representation
from VonNeumannAlgebras V0; use CStarAlgebras C2 for the pure-state predicate and its
equivalence with irreducibility of cyclic GNS representations, and V4 for the normal subspace
of states on a concrete von Neumann algebra. A model selects a subset of those states
and a representation `π : A → B(H)` with explicit compatibility conditions; it does not
introduce another generic C*-state carrier. Define effects and finite and measurable outcome
measurements. For measurable outcome space `(Ω,Σ)`, a POVM is a weak-operator-countably
additive map `E : Σ → B(H)` with `E(∅)=0`, `E(Ω)=1`, and `0≤E(S)≤1`; a PVM additionally
has projection values and `E(S)E(T)=E(S∩T)`. Consume SelfAdjointSpectralTheory's native `ProjValMeasure` and bounded-Borel function carriers where applicable; QF proves their POVM/PVM comparison and model-specific outcome laws without defining a second generic PVM carrier. Prove these two interfaces distinct and show a
finite PVM is a special POVM.

**QF1.MeasurementPresentations — positivity, labels and normalization.** On the finite matrix and general Hilbert-space carriers, positivity and total normalization imply contractivity: for a finite family, `1−E_i=Σ_(j≠i)E_j≥0`; for a measurable event, `1−E(S)=E(Sᶜ)≥0`, using disjoint additivity. Prove these identities and use the resulting theorem when a construction presents positivity and normalization as its independent data. A definition that also records contractivity presents the same measurements; prove the forgetful/construction maps inverse. For the measurable case retain actual weak-operator countable additivity and the separate state-normality hypotheses above: finite positivity/normalization supplies neither of them.

A finite operational model may have a different finite outcome type for each measurement. Transport POVMs, effects, Born laws, coarse-grainings and instruments along an outcome equivalence, proving identity/composition and invariance of probabilities under the corresponding label change. A cardinal presentation uses `Fin (o(m))` after choosing equivalences; prove independence of that choice. A common outcome type and a constant cardinal are explicit specializations, with their inclusion and evaluation identities. Neither a common cardinal nor an ordering of physical outcomes is required by the general model.

For a state `φ`, define `μ_{φ,E}(S)=φ(E(S))` where this expression is meaningful. Prove
positivity and normalization for every state. Prove countable additivity for normal states on
`B(H)` when the POVM is weak-operator-countably additive; for a bounded state on a unital
C*-algebra prove it when the measurement is countably additive in operator norm. Finite-
outcome POVMs need no normality condition. In a Hilbert representation prove
the vector formula `μ_{ψ,E}(S)=⟪ψ,E(S)ψ⟫`; for a sharp observable supplied by
SelfAdjointSpectralTheory prove it equals `‖P_A(S)ψ‖²`. Reuse SAST's `ProjValMeasure` and its bounded-Borel calculus (including the `BoundedBorelFunction` carrier) instead of defining either generic carrier here. For normal states on `B(H)` prove
the trace formula `Tr(ρE(S))`, including basis independence, positivity and total mass one.
Define operational equivalence of states by equality on the selected effects, and prove
separation exactly when the model's effect family separates states. Prove finite-measurement
coarse-graining by measurable pushforward, disjoint-event additivity, complement probability,
and functional calculus for finite-valued observables. Model time evolution either as a chosen strongly continuous unitary group or as a family
`(Φ_t)_{t≥0}` of normal unital completely positive maps on `B(H)` satisfying `Φ_0=id`,
`Φ_{s+t}=Φ_s∘Φ_t`, and pointwise ultraweak continuity; state separately when a predual
trace-preserving channel is used. Connect unitary groups to Stone's theorem under its supplier
hypotheses. For self-adjoint `H` put `U_t=e^{-itH}` and, for a closed
densely-defined observable `A`, define `A_t=U_t^*AU_t` on
`D(A_t)=U_t^*D(A)`. State the differentiated law on the following explicit domain:
a dense common invariant core `D` for both `H` and `A`, with `D⊆D(H)∩D(A)`,
`H(D),A(D)⊆D` and `U_tD=D`; for each `ψ∈D`, require `t↦U_tψ` to be differentiable in the graph norm
`‖x‖+‖Ax‖` with derivative `−iHU_tψ`.
Prove the product rule in norm on `D`, yielding
`(d/dt)A_tψ=iU_t^*(HA−AH)U_tψ=i(HA_t−A_tH)ψ`.
For bounded unitary `T` with `T D(H)⊆D(H)` and `HTψ=THψ` on `D(H)`, prove
commutation with the resolvent and spectral calculus, hence `TU_t=U_tT` and conservation of `A` when `A_t=A`. Conversely, for bounded unitary `T`, prove `TU_t=U_tT` for every `t` implies `T D(H)=D(H)` and `HT=TH` by the generator definition. Equality on a core for `H` suffices only after closedness extends the relation to its full domain. For bounded
antiunitary `T` with the same domain/intertwining hypothesis, prove instead
`TU_t=U_{−t}T`, the time-reversal identity. For an unbounded self-adjoint constant
of motion, consume UO-B03's strong commutation of spectral PVMs; mere commutation
on a common invariant core does not suffice. Keep the CP-semigroup and unitary dynamics targets
with their separate hypotheses.

For any orthogonal projection family, joins are lattice suprema or strong-operator limits; an
infinite orthogonal family is not norm-summable in general. Do not express PVM/POVM countable
additivity by a norm-topology `tsum` of projection operators.

A finite worked model is a qubit with its explicit `2 × 2` Hermitian matrices, Bloch
ball state coordinates, Pauli projections, and the `σ_z` measurement. Compute both vector and
density-matrix outcome probabilities, the maximally mixed state, and a nonprojective binary
effect measurement. Also give a classical finite sample space as a commutative algebra model.

For every normalized weak-operator-countably additive POVM prove the **Naimark dilation
theorem**: construct a Hilbert space `K`, an isometry `V : H → K`, and a normalized PVM
`Q : Σ → B(K)` with `E(S)=V†Q(S)V`; impose minimality
`K=closure(span{Q(S)Vξ})` and prove uniqueness by an intertwining unitary fixing `VH`.
Construct the dilation from bounded simple functions on `Ω` with values in `H`, the positive
form `⟪1_S⊗ξ,1_T⊗η⟫=⟪ξ,E(S∩T)η⟫`, quotient by its null space and complete. Prove form
positivity, PVM multiplication, countable additivity and compression identity. Also derive
this dilation by CStarAlgebras C4 Stinespring applied to the integration map
`I_E:BoundedBorelFunction Ω→B(H)` on the arbitrary measurable outcome space
`(Ω,Σ)`. Consume SAST SA-B01's measurable-space carrier, SA-B37's complete
supremum-norm C*-algebra structure, and SA-B39's uniform finite-range
approximation. For simple symbols set `I_E(Σ_j c_j 1_(S_j))=Σ_j c_j E(S_j)`
on a finite measurable partition and prove independence of the partition.
Prove complete positivity for pointwise positive matrices of simple symbols
using their common finite measurable partition. Identify the native C*-algebra `M_n(BoundedBorelFunction Ω)` with bounded measurable `M_n(ℂ)`-valued functions, through entrywise evaluation and the supremum matrix norm. Prove in both directions that abstract C*-positivity is equivalent to pointwise positive-semidefiniteness. Evaluation is a *-homomorphism for the forward direction. For the converse, construct the pointwise positive matrix square root; continuity of the finite-dimensional square-root map gives measurable entries, and `‖A(ω)^(1/2)‖≤sqrt(sup_ω‖A(ω)‖)` gives boundedness. Its factorization as B*B proves abstract positivity. This identification holds for the arbitrary measurable outcome space; it introduces no topology on Ω. Deduce the supremum-norm
bound by the positive 2×2 matrix test. Extend in the supremum norm.
Approximate a bounded measurable positive matrix-valued symbol
uniformly by finite-range symbols with positive matrix values: choose a finite
mesh in its bounded positive-matrix range and take the measurable disjoint
preimages. Pass to the limit in each matrix amplification. Normalization
makes the map unital. When H is nonzero a normalized POVM forces Ω nonempty;
for H=0 give the zero-space dilation directly. No standard-Borel or topology
assumption on Ω is needed for this route, and the bounded-function carrier is
not redeveloped here. Prove that the minimal dilation's PVM is
countably additive in the strong operator topology: first establish countable additivity of the
compressed scalar forms from the POVM, then use minimality and density of the span of
`Q(S)Vξ` to obtain strong convergence on a dense subspace and extend by the uniform projection
bound. A Stinespring representation of the bounded measurable-function algebra alone does not
assert this σ-additivity.

Define a normal quantum instrument on `B(H)` with outcome space `(Ω,Σ)` as a map from
events to bounded completely positive maps on trace class `S₁(H)`, with normal Banach-dual maps on `B(H)`, countably additive in trace norm on every
positive trace-class input, with `I_Ω` trace preserving. Prove each `I_S` is trace-nonincreasing;
its normal dual `I_S^* : B(H) → B(H)` is CP and subunital, and `E(S)=I_S^*(1)` is the
associated POVM. Prove instrument composition for standard-Borel outcome spaces (or for countable discrete spaces), by constructing the product-outcome instrument and verifying countable additivity; arbitrary measurable outcome spaces require an explicit extension theorem, not rectangle data alone. Prove state transport, outcome probability
`Tr(I_S(ρ))=Tr(ρE(S))`, and conditional update
`ρ ↦ I_S(ρ)/Tr(I_S(ρ))` when the denominator is positive. Define the nonselective channel
`I_Ω` and prove its dual is unital. For a **countable discrete sharp observable** with atoms
`(P_i)_{i∈I}`, pairwise orthogonal and with strong sum `∑_i P_i=1`, define its Lüders
instrument by `I_S(ρ)=∑_{i∈S}P_iρP_i` for each `S⊆I`. Prove this series converges in trace
norm on positive trace-class inputs and extends to all trace-class inputs, is countably additive
as an instrument, and gives the selective update and nonselective pinching map. Prove the exact
repeatability law `I_S^*(P(T))=P(S∩T)`, where `P(T)=∑_{j∈T}P_j`; derive certainty of the same
outcome under a second measurement whenever the first outcome has positive probability; when
that probability is zero, record the corresponding joint probability as zero and do not define a
conditioned state. A single
yes/no Lüders operation for one fixed event `A∈Σ` is the two-outcome instrument with operations
`ρ↦P(A)ρP(A)` and `ρ↦P(Aᶜ)ρP(Aᶜ)`; do not confuse this instrument with a set-indexed family
`S↦P(S)ρP(S)`. The latter family is not countably additive in general (exhibit a noncommuting
state for a two-atom partition). For a standard Borel outcome space and nonzero separable Hilbert space, prove that a sharp PVM admits a normal repeatable instrument exactly when it is concentrated on a countable set of atoms. Here repeatability means `I_S^*(P(T))=P(S∩T)` for all measurable `S,T`; the converse is the countable Lüders construction. For necessity, own trace-class-valued Radon–Nikodym disintegration for the output measure of a fixed faithful normal input state, and use a countable generating algebra of the standard Borel space to prove its conditional output density at outcome `x` is supported in `P({x})H`. The nonzero singleton projections are pairwise orthogonal, hence countable by separability; faithfulness removes the residual continuous part. State and prove each normality, disintegration and support lemma with these hypotheses. Deduce explicitly that the nonatomic position PVM on `L²(ℝ)` has no normal repeatable instrument. This does not prevent ordinary normal nonrepeatable instruments for continuous observables. For a discrete sharp PVM `(P_i)`, state repeatability as
`I_i(ρ)=P_i I_i(ρ)P_i` for every positive trace-class input, with associated observable condition `I_i^*(1)=P_i`; equivalently, under that condition, `I_i^*(P_j)=δᵢⱼ I_i^*(1)`. Call the latter the weak repeatability identity. Distinguish it from strong repeatability, the composition equations `I_i∘I_j=0` for `i≠j` and `I_i∘I_i=I_i`. For the associated POVM `E_i=I_i^*(1)`, strong repeatability always implies the POVM identity `I_i^*(E_j)=(I_j∘I_i)^*(1)=δᵢⱼE_i`. Neither this identity nor strong repeatability implies that the effects are projections. For weak repeatability relative to a specified sharp PVM, require the additional compatibility `E_i=P_i`. Under strong repeatability and that compatibility, the cross-composition equations force each positive output of `I_i` to have zero probability in each `P_j`, `j≠i`, hence to be supported in `P_iH`; this proves weak repeatability `I_i^*(P_j)=δᵢⱼP_i`. Conversely, weak repeatability together with `I_i^*(1)=P_i` gives cross-composition, while strong repeatability additionally requires `I_i∘I_i=I_i`. Prove these implications on positive trace-class inputs and extend by linearity; show the Lüders instrument is strongly repeatable. Include a counterexample showing why normalization and strong repeatability do not imply sharpness: on `ℂ³`, let `E₁=diag(1,1/2,0)`, `E₂=diag(0,1/2,1)`, `I₁(ρ)=Tr(E₁ρ)|e₁⟩⟨e₁|`, and `I₂(ρ)=Tr(E₂ρ)|e₃⟩⟨e₃|`. This instrument is normalized and strongly repeatable, but `(E₁,E₂)` is not a PVM. Characterize weakly repeatable instruments satisfying these hypotheses; exhibit a
repeatable non-Lüders example `I_i(ρ)=Tr(P_iρ)σ_i` when `σ_i` is a fixed density operator
supported in `P_iH`; any non-Lüders example based on changing states inside an outcome requires some `P_i` of rank at least two (rank-one outcomes give the Lüders map in that construction). Do not ascribe the Lüders update to every instrument with that POVM. The generic CP dilation is consumed from
C4; the trace-class carrier and norm come from OperatorIdeals Part B and its normal duality from
V4; only the measurement-specific Naimark/instrument laws and state-map identities are developed here.

### QF1.G — actions on general operational logics

**QF1.G.Core.** On QF1's orthocomplemented poset L with countable orthogonal joins, use native
`OrderIso L L` together with preservation of the specified orthocomplement.
Prove that these maps preserve every existing join, in particular countable
orthogonal joins; build the identity, composition, inverse and action APIs.
For a selected full, countably convex family S of probability measures on L
and a selected family O of L-valued Borel measures on ℝ, a logic automorphism induces an operational
symmetry exactly when
`{ω∘α⁻¹:ω∈S}=S` and `{α∘E:E∈O}=O`. This condition is additional to being a logic
automorphism. Work with operationally separated states and observables, or
first quotient their equality-of-all-outcome-laws relations.

For a group action α with α_(gh)=α_g∘α_h, prove the forced state and observable
laws

```
(g·ω)(p)=ω(α_(g⁻¹)(p)),
E_(g·A)(B)=α_g(E_A(B)),
p(g·A,g·ω,B)=p(A,ω,B).
```

For the converse on all of L also require question representability:
every q∈L equals E_A(B) for an available A∈O and a Borel set B.
Axiom(c) then supplies the binary observable Q_q=1_B(A) in O. Under this
hypothesis, state/observable separation and state fullness, reconstruct the
logic automorphism from a probability-preserving action on the operational
system. Prove independence of the representation q=E_A(B), complement and
countable orthogonal-join preservation, and the group laws. Use axiom(c)
and separation to prove g(f(A))=f(gA). The earlier full-observable model
satisfies question representability by its binary observables; a selected
family alone does not assert it. Prove identity,
composition, restriction to an invariant state/observable family, and transport
under an operational isomorphism. Use actual countable-join preservation, not
a Hilbert implementer assumption. These are the general orthoposet actions of
Dooley p11; QF5.G supplies the additional reconstruction theorem for von
Neumann projection logics.

**QF1.G.ProjectionExamples.** Include the six-element horizontal sum of two four-element Boolean algebras:
L={0,1,a,a′,b,b′}, with distinct atoms incomparable and a⊥a′, b⊥b′.
Its full probability-state space is [0,1]² via ω(a)=s, ω(b)=t; prove fullness,
countable convex closure and the operational action above. Compute its logic
automorphism group as (C₂×C₂)⋊S₂, of order8. Prove it is not P(M) for any
complex von Neumann algebra M: a finite projection set forces M abelian
(a nonabelian summand supplies a matrix-unit corner and infinitely many
rank-one projections), while this lattice is non-Boolean. Thus general
operational logics are not all entire Hilbert or von Neumann projection
models. This does not refute the source IV′ sublattice variant: choose
distinct nonorthogonal rank-one projections p,q in M₂(ℂ); the six projections
0,1,p,1−p,q,1−q are closed under meets, joins and complement and realize
this MO₂ as a projection sublattice. With the full square state space,
however, no meet-preserving embedding realizes every state by a normal
state: the vertex s=1,t=0 would have support at most a∧b′=0. Prove both
distinctions. Generalize the horizontal sum to MO_n, n≥2, and identify the
full automorphism group C₂≀S_n: on labelled atoms (i,b),
(p,e) sends (i,b) to (p(i),b+e_i) in ℤ/2;
(p,e)(q,f)=(p∘q,(f_i+e_(q(i)))_i). Its order is 2^n n!.


### QF1.S — Segal powers, states and bounded spectral comparison

QF1 owns the following Segal interface and its basic theory. A Segal system is a nonzero real Banach space `A` with a distinguished nonzero unit `1` and operations `x↦xⁿ`, `n∈ℕ`. Require `x⁰=1`, `x¹=x`, and, for real polynomials evaluated by `f[x]=Σ_k f.coeff(k) • xᵏ`, the composition identity `f[g[x]]=(f.comp g)[x]`. Require `‖x²‖=‖x‖²`, `‖x²−y²‖≤max(‖x‖²,‖y‖²)`, and continuity of the square map. Do not assume an associative or bilinear product on this general carrier.

Build the polynomial API (constants, identity polynomial, addition, scalar multiplication, composition and power substitution), the singly generated commutative real Banach algebra and its continuous functional calculus, spectrum, spectral-radius/norm formula, positive square roots and order bounds. Prove `‖1‖=1`. Define an algebraic state to be a real-linear functional `φ:A→ₗ[ℝ]ℝ` satisfying `φ(1)=1` and `φ(x²)≥0` for every `x`. Prove existence and point separation by all such states, the norm formula `‖x‖=sup_φ |φ(x)|`, and `|φ(x)|≤‖x‖`. In particular every algebraic state is continuous of operator norm one; identify this carrier with the corresponding subtype of `A→L[ℝ]ℝ`. The state-extension/separation argument and singly generated functional calculus are QF1.S targets, including their hypotheses, rather than an assumed C*-algebra structure on `A`. Consume the existing real normed-space, Hahn–Banach, polynomial and continuous-functional-calculus infrastructure where it applies; construct the Segal-specific adapters here.

Write `Σ(A)` for **all** positive normalized real-linear states and define the canonical order by `x≤_Σy ↔ ∀φ∈Σ(A), φ(x)≤φ(y)`. Prove its ordered-vector-space laws, closedness of its cone, `−‖x‖1≤_Σx≤_Σ‖x‖1`, and the dual-cone description: its positive cone is the closed convex cone generated by squares. Own the Hahn–Banach separation and state-normalization steps in that description. When comparing with an independently defined positive cone in a concrete model, prove equality of the cones. In particular recover the positive-operator order on `B(H)ₛₐ` and coordinatewise order on `ℝ²`.

For any nonempty selected family `M⊆Σ(A)`, call it point-full if equal values on all `m∈M` force equality in `A`; call it order-determining if `∀x y, (∀m∈M, m(x)≤m(y))→x≤_Σy`; call it norming if `‖x‖=sup_{m∈M}|m(x)|`. Prove **norming ⇔ order-determining ⇒ point-full** using the all-state norm formula and bounds above. For norming ⇒ order determination, if `m(z)≥0` on `M`, set `c=‖z‖`; selected evaluations of `c1−z` lie in `[0,c]`, so norming gives `‖c1−z‖≤c`, and the bound for every `φ∈Σ(A)` gives `φ(z)≥0`. For the converse, set `r=sup_{m∈M}|m(x)|`, use order determination on `−r1≤_M x≤_M r1`, and then apply the all-state norm formula. Point separation follows from the same formula. Embedding data also require convexity of `M`, but require only point-fullness. The canonical order always uses `Σ(A)`; use order determination only for targets that compare it with selected evaluations. Pulmannová's designated family has her printed norm formula and is therefore order-determining; her order quantifiers are literally over that chosen `M`. Include the counterexample `A=ℝ²`, `m_w(x,y)=wx+(1−w)y`, `w∈[1/10,1/5]`: this convex point-full family compares `(1,0)≤_M(0,1)`, whereas the canonical order does not. Thus selected point separation alone supplies no canonical order comparison.

**QF1.S.QuestionFullnessExample.** Distinguish Dooley p3's fullness on
questions from order determination on all Segal observables. In `A=ℝ²` with
coordinatewise powers and supremum norm, take the countably convex family
`m_w(x,y)=wx+(1−w)y`, `w∈[1/4,3/4]`. Prove these are normalized positive
states and that their restrictions are full on the four-element Boolean
projection lattice `P(A)={0,(1,0),(0,1),1}`. Construct the corresponding
Mackey model with this selected family and all real functions on the two-point
space as observables. Prove the family separates all of A, but is neither
norming nor order-determining there: every selected state is nonnegative on
`(−1,3)`, which is not canonically positive, and
`sup_w |m_w(1,−1)|=1/2<‖(1,−1)‖=1`.
The selected expectation norm therefore fails the Segal square law:
its value on `(1,−1)²=1` is1, while its squared value on `(1,−1)` is1/4.
This example satisfies logic fullness and countable convex closure together;
those hypotheses do not supply the all-observable norm/order bridge.
[SelectedStateExamples.lean](SelectedStateExamples.lean) gives representative
native finite-function targets for this distinction.

Let `P(A)={p:p²=p}`. Give it the canonical inherited order; define `p⊥q` by `p+q≤_Σ1`. Define compatibility by pairwise orthogonal `p₀,q₀,c∈P(A)` with `p=p₀+c` and `q=q₀+c`. Build complement, positivity, interval bounds, the orthogonality criteria and the finite/countable join results under their stated closure conditions. Keep the two polarizations `x∘ₛy=¼((x+y)²−(x−y)²)` and `x∘ₚy=½((x+y)²−x²−y²)` distinct until their equality is proved. Here distributivity means `x∘ₛ(y+z)=x∘ₛy+x∘ₛz`; it does not mean distributivity of a proposition lattice. In this subclass prove symmetry, additivity in both variables and real bilinearity, using continuity of polarization to pass from rational to real homogeneity. Prove `x∘ₛx=x²`, the bilinear square expansion, and hence `∘ₛ=∘ₚ`. The power-composition law gives `(x²)²=x⁴`; prove power-associativity of the bilinear product. With the two Segal norm axioms, prove the Jordan identity and JB norm laws by the Banach-power-associative argument of Iochum–Loupias, Propositions I.4–I.5, Theorem V.1 and Corollary V.3. The passage from fourth powers to full power-associativity is a theorem target with its polynomial-composition hypotheses, not an additional algebra axiom. Construct Mathlib's native `IsCommJordan` instance for this product and its nonassociative ring/module API. Jordan identity is a conclusion for this distributive normed subclass, with no such assertion about the general Segal carrier. The source's stronger word “commutative” also includes associativity and scalar homogeneity.

Own the projection-order API for the resulting unital JB-algebra by the internal quadratic-representation route. Prove from the JB norm laws and singly generated functional calculus that the square cone is closed and convex, equals the canonical all-state cone, and that its positive invertible elements are exactly those bounded below by `ε1`, ε>0. Use the spectral-radius/norm formula and the square-root calculus; the cone proof must precede quadratic-representation positivity. Define `U_a b=2a∘ₛ(a∘ₛb)−a²∘ₛb`. Own algebraic Shirshov–Cohn speciality and Macdonald's polynomial-identity theorem, and the quadratic identities, including the fundamental formula `U_(U_a b)=U_a U_b U_a` and `(U_b a)²=U_b U_a(b²)`, through their formal Jordan-identity API. Define Jordan invertibility by the existence of b with `a∘b=1` and `a²∘b=a`; first prove algebraically uniqueness, equivalence with invertibility of U_a and `U_(a⁻¹)=U_a⁻¹`. Then prove the inverse lies in the closed singly generated algebra C(a) and that invertibility in A agrees with invertibility there. If a were Jordan-invertible but zero lay in its C(a) spectrum, choose `y_n∈C(a)≃C(X)` with norm1 and `a∘y_n→0`. In this associative subalgebra, `U_a(y_n²)=(a∘y_n)²→0`, contradicting the lower bound from the bounded inverse U_a⁻¹ and `‖y_n²‖=1`. The converse follows directly from the C(a) inverse equations. Prove that U_a takes invertible elements to invertible elements when a is invertible. These are algebraic and singly generated spectral targets, not C*-norm representation assumptions.

Prove `U_a(A_+)⊆A_+` for every a, including noninvertible a, following [Alfsen–Shultz–Størmer (1978), Proposition2.7](https://doi.org/10.1016/0001-8708(78)90044-0). First, for invertible a, `U_a(A_+^×)` is convex, consists of invertibles and contains1. Using the proved equality of the A and C(a) spectra, if an element of that set had a negative spectral value, its line segment to1 would meet a noninvertible element, a contradiction. Extend to all positive inputs by continuity and `b+ε1→b`. For arbitrary a and positive invertible c, put `b=c^(1/2)` and use `(U_b a)²=U_b U_a(c)`; apply the already positive `U_(b⁻¹)` to obtain positivity of U_a(c), and again approximate positive inputs by `c+ε1`. This last approximation concerns the positive input, not density of invertible a in A. Own the cone, spectral, inverse and continuity lemmas used in all four steps; [the primary proof's §2, Propositions2.1–2.7](https://www.researchgate.net/publication/256105444_A_Gelfand-Naimark_Theorem_for_Jordan_Algebras) gives this route before its bidual construction.

Prove the Peirce decomposition relative to an idempotent p and the associated projection identities for U_p and U_(1−p). If x≥0 and U_p x=0, write x=x_(1/2)+x_0. Positivity of `U_(sp+(1−p))x=s x_(1/2)+x_0` for every real s and the pointed all-state cone force `x_(1/2)=0`. Thus `x=U_(1−p)x`; prove the converse as well. This is the internal positive-block vanishing lemma. For idempotents p,e, positivity gives `0≤U_(1−e)p≤U_(1−e)e=0` when p≤e; the block lemma and Peirce identities imply `p∘ₛe=p`. Conversely that identity makes e−p idempotent and hence positive, proving `p≤e ⇔ p∘ₛe=p`. This recovers [Alfsen–Shultz–Størmer, Corollary2.10] through the stated internal lemmas.

Then `p+q≤_Σ1` gives `q≤_Σ1−p`, hence `q∘ₛ(1−p)=q` and `p∘ₛq=0`; the square expansion makes p+q idempotent. It is an upper bound of p,q because both are squares and therefore positive. Any idempotent upper bound r satisfies `r∘ₛ(p+q)=p+q`, so p+q≤_Σr. This proves β in the distributive subclass with every positivity and order step owned here.

For the Mackey carrier, use QF1's orthomodular σ-orthocomplemented poset `L`, selected nonempty convex order-full state family `N`, and full observable family `O`. An observable maps Borel subsets of `ℝ` to `L`, takes `ℝ` to `1`, takes disjoint sets to orthogonal propositions, and preserves countable disjoint unions as orthogonal joins. Fullness of `O` means closure under every real-valued Borel functional calculus `u(x)(E)=x(u⁻¹(E))` and that every proposition is `x(E)` for some `x∈O`. It does not mean convexity of `O`. Proposition compatibility is the orthogonal-join decomposition; observable compatibility requires it for every pair `x(E),y(F)`. State expectations are integrals with an explicit absolute-integrability hypothesis. For bounded observables define the selected expectation quantity `sup_{n∈N}|n(x)|`; prove its norm properties only after specifying an observable vector space and expectation separation. Logic fullness alone does not supply the Segal square law, as QF1.S.QuestionFullnessExample shows. Keep absolute integrability explicit for unbounded observables.

A Segal-to-Mackey embedding is an affine bijection `α:M≃N` and an injective `τ:A→O` such that (i) every `α(m)(τ(x))` is absolutely integrable and equals `m(x)`; (ii) `τ(xⁿ)=τ(x)ⁿ` for all `n∈ℕ`, with observable powers given by Borel pushforward; (iii) if `y∈O` has absolutely integrable expectation in every `α(m)` and all those expectations equal `m(x)`, then `y=τ(x)`. Prove the resulting observable-sum uniqueness statement: any `y∈O` absolutely integrable in every `α(m)` whose expectations are `m(x)+m(z)` in every selected state equals `τ(x+z)`. This makes `τ` additive whenever the Mackey sum is defined by those expectations; existence of every abstract observable sum is not an embedding axiom.

For such an embedding put `P⁰={m↦m(p):p∈P(A)}` and `L₁={m↦α(m)(c):c∈L}`. Prove `P⁰⊆L₁`, zero/complement closure, and countable pointwise-sum closure: if `f_i+f_j≤1` for distinct indices, order-fullness of `N` makes their propositions orthogonal, and countable additivity identifies `Σ_i f_i` with their join profile and bounds it by one. This is a necessary condition for embedding, with no sufficiency claim.

For every embedding above, with only point-fullness of `M`, prove the necessary condition **(CA)**: if a countable family of pairwise orthogonal idempotents `a_i` has `Σ_i m(a_i)=m(a)` for every `m∈M`, for some `a∈A`, then `a∈P(A)` and `a` is their supremum in the canonical idempotent order. Prove first that `τ` identifies idempotents with question observables. Order-fullness of `N` makes the propositions for `τ(a_i)` orthogonal; their join has the same expectations as `τ(a)`, and clause (iii) and powers imply `a²=a`. For any idempotent upper bound `p`, its proposition `d` dominates that join `c`; the question for `(c∨d′)′` has profile `m(p−a)`. Apply clause (iii) to obtain `(p−a)²=p−a`, hence `p−a≥_Σ0`. Apply the same question-difference argument to `c_i≤c` to get `a_i≤_Σa` before applying it to an arbitrary upper bound. This proves the supremum conclusion without assuming `M` order-determining.

For the following **internal equivalence** on a Segal system with its selected family, assume `M` order-determining and do not assume an embedding exists. Prove **(CA)⇔(β and γ)**, where **β** says `a+b` is the idempotent join whenever `a⊥b`, and **γ** says that if an increasing sequence `p_n∈P(A)` has `m(p_n)→m(s)` for every `m∈M`, for some `s∈A`, then `s∈P(A)`. This is convergence of the selected evaluations; it is not norm convergence.
For (CA)⇒γ, first derive β from (CA) applied to a finite family and zeros.
For idempotents p≤_Σq, polynomial calculus makes 1−q idempotent and
`p+(1−q)≤_Σ1`; β makes p+1−q idempotent, so its polynomial complement
q−p is idempotent. Moreover `p+(q−p)=q≤_Σ1`, so these are orthogonal.
Given the increasing p_n, put d₀=p₀ and d_n=p_n−p_(n−1) for n≥1.
They are idempotents and pairwise orthogonal: for i<j,
`d_i≤_Σp_i≤_Σp_(j−1)` and `d_j≤_Σ1−p_(j−1)`.
Their finite sums telescope to p_n, and their selected evaluations sum to
m(s); apply (CA) to obtain s²=s. This argument uses β and the ordered
vector-space laws, without product distributivity. For the converse, use
β repeatedly for finite orthogonal sums: if `s_n=Σ_(i≤n)a_i`, pairwise orthogonality gives `a_i≤1−a_(n+1)` for every i≤n. The least-upper-bound conclusion of β then gives `s_n≤1−a_(n+1)`, hence `s_n⊥a_(n+1)` and the next finite join. Apply γ to their selected-state
limit. State positivity bounds and order determination give each finite sum
≤_Σs and s≤_Σ every idempotent upper bound. Thus s is the canonical
supremum. Prove the same supremum conclusion in γ directly from
`m(p_n)→m(s)` and order determination. Prove **β⇔δ** for the general Segal carrier, where **δ** is the following
fully quantified statement: for every `a,b,c∈P(A)` satisfying
`a+b≤_Σ1`, `a+c≤_Σ1` and `b+c≤_Σ1`,
`(a+b)∘ₚc=a∘ₚc+b∘ₚc=0`. Zero is allowed in the triple; the three elements
need not be distinct. There is no additional premise that their triple sum
is idempotent or bounded by 1, and no join-existence premise. For δ⇒β,
apply δ to `(a,0,c)` to obtain `a∘ₚc=0` whenever a⊥c, making a+c
idempotent by the defining polarization identity. If an idempotent d bounds
orthogonal a,b, then a,b,1−d satisfy the three hypotheses; δ gives
`(a+b)∘ₚ(1−d)=0`. Thus a+b+1−d is idempotent and hence ≤_Σ1,
so a+b≤_Σd. For β⇒δ, the pairwise sums are idempotent. Since both
a,b≤_Σ1−c, β's least-upper-bound property gives a+b≤_Σ1−c;
a second application of β makes a+b+c idempotent. The defining square
identities now give each equality in δ. This equivalence does not remove γ. In the distributive subclass, consume the preceding owned β derivation and prove compatibility equivalent to `a∘ₚb` being the idempotent greatest lower bound of `a,b`; their join is then `a+b−a∘ₚb`. State existence by the greatest-lower-bound property, without presupposing a global lattice on `P(A)`. These are the necessary/internal conditions in Pulmannová's Theorems 1–5; no embedding sufficiency theorem is asserted.

The bounded Hilbert comparison uses a nonzero complex Hilbert space `H`, `A=B(H)ₛₐ`, and **all normal states** `m_ρ(T)=Tr(ρT)` with positive trace-class `ρ`, `Trρ=1`. Prove they are convex, point-full, order-determining and norming by vector states and the self-adjoint numerical-radius formula. Identify `P(A)` with orthogonal projections ordered by range inclusion. With the same states on projections, prove countable additivity and order fullness. Consume SelfAdjointSpectralTheory SA-B31, SA-B35, SA-E44 and SA-E45 for the bounded self-adjoint spectral PVM, its `T=∫x dP` identity, uniqueness and bounded compatibility. QF1.S owns the Segal/Mackey adapter: identify the supplied bounded spectral map with bounded-support PVMs, prove expectation preservation and power pushforward, and derive uniqueness among bounded-support PVMs from the supplier uniqueness theorem. This is a bounded comparison: bounded-support PVMs are not closed under every Borel real function. The all-PVM Mackey carrier and full embedding uniqueness result are developed in the independent QF3.S milestone from QF1.S and the named unbounded spectral interfaces.

For a nonzero complex Hilbert space, identify the Segal states on `B(H)ₛₐ` with the shared V0 positive normalized complex-linear states on `B(H)`. Restrict a V0 state to the self-adjoint part; extend a real Segal state by `φ_C(a)=φ((a+a*)/2)+iφ((a−a*)/(2i))`. Prove complex linearity, positivity, normalization, boundedness, and that restriction and extension are inverse affine maps. Match the normal-state subfamilies using V4's trace-class pairing. Use this adapter whenever a Segal state enters the C*-algebra model rather than introducing another competing operational state carrier.

**QF1.S.GudderBoyce — full-state realization in a weak Mackey model.**
For the Segal system A above use its entire state set Σ(A), not an arbitrary
selected point-full family. Prove countable convex closure of Σ(A). On QF1's
probability data (O,Σ(A),p), use Gudder–Boyce's weak Mackey axioms
([§2, pp7–9](https://doi.org/10.1007/BF00674006)):

1. Each p(x,m,·) is a Borel probability measure on ℝ.
2. Equality of all outcome laws separates observables, and equality on all
   observables/events separates states.
3. Every real-valued Borel f gives an observable f(x) with
   p(f(x),m,E)=p(x,m,f⁻¹(E)).
4. Every countable convex mixture of states exists and gives the corresponding
   mixture of every outcome law.
5. If E₁,E₂ are disjoint and p(y,m,F) bounds each of p(x,m,E₁),
   p(x,m,E₂) for every m, it also bounds p(x,m,E₁∪E₂) for every m.
6. If p(x,m,E)>0 for some m, a state m₁ exists with p(x,m₁,E)=1.

The two-event upper-bound axiom5 is weaker than the countable orthogonal-event
existence axiom5′ printed on p8. Do not assert axiom5′ for this construction.
Use absolute integrability to define m(x)=∫t dp(x,m,t), bounded-support
observables for boundedness, and the selected expectation supremum for their
norm quantity. A sum z of x,y means an observable with integrable expectations
m(z)=m(x)+m(y) in every state. This relation alone asserts neither existence
for arbitrary x,y nor uniqueness.

Prove Theorem6.1 (§6, pp18–19): construct such a weak model and an injective
τ:A→O preserving every real polynomial calculus, expectations and norms,

```text
τ(q[a])=q(τ(a)),   m(τ(a))=m(a),
τ(a+b) is a sum of τ(a),τ(b),   sup_m |m(τ(a))|=‖a‖.
```

In particular τ(a) has bounded support and its expectations are integrable.
Build the commutative Segal-subsystem representation used in the proof:
closed unital power-closed subsystems whose polarized product is bilinear
and associative are real continuous-function algebras; restrict a state to
each such subsystem and represent it by a probability measure. Prove state
extension from these subsystems to A, and the compatibility of the resulting
Borel observable descriptions under equality of all statewise laws. Use
these facts to verify all six weak axioms, including probability-one states.
These representation, extension and quotient-construction steps are owned
here, rather than supplied by the name “realization.”

Prove Corollaries6.2–6.3: τ preserves and reflects the canonical order of
idempotents and their complements, and commuting Segal observables have
compatible ranges in this realization. Here a family commutes when the
subsystem it generates has the preceding bilinear associative product.

For two weak models with the same state set, define an embedding δ:O₁→O₂
to be injective, preserve every real Borel functional calculus, and preserve
every probability p(δx,m,E)=p(x,m,E). Prove identity and composition.
A realization of (A,Σ(A)) consists of the weak model and τ with the four
properties above. Prove Theorem6.4 (pp20–21): the Borel closure of single
images τ(a) has a minimal realization, embedding into every realization.
Construct its comparison map [f(a)]↦f(τ₁(a)), prove independence of the
description and both embedding laws; this map also intertwines the two τ's.
Do not transfer Corollary6.3's commuting-range assertion to the minimal
realization, where the paper explicitly warns it can fail.

This full-state theorem does not by itself prove the preceding normal-state
Hilbert adapter: normal states are a selected subfamily of all Segal states
on B(H)ₛₐ. That adapter and QF3.S retain their separate spectral, state and
uniqueness proofs. Gudder–Boyce's realization sum relation also does not
supply Pulmannová's stronger expectation-uniqueness embedding clause.

### QF1.P — Tychonoff products and Hilbert sums

For a family of real Banach spaces or a family of complex Banach spaces `(E_i)`, give `∏_iE_i` the Tychonoff product topology. Call `i` active when `E_i≠{0}`. Prove this topological vector space is normable if and only if there are finitely many active indices. If a norm induced the product topology, its unit ball would contain a basic neighborhood restricting finitely many coordinates `F`. An active `j∉F` gives an entire nonzero coordinate line in that ball, a contradiction. Conversely discard zero factors and use a finite sum norm. This argument includes countable products, which may be first countable.

Prove that the product admits an equivalent complete Hilbert norm if and only if the active set is finite and each active factor admits an equivalent Hilbert norm. In the forward direction use the normability result and identify each factor as the quotient by a closed coordinate kernel of the Hilbert realization; in the reverse direction use the finite orthogonal sum.

For arbitrary Hilbert families consume Mathlib's heterogeneous `lp (fun i=>H_i) 2`, its inner product/completeness, `evalCLM`, `single`, `hasSum_single` and `IsHilbertSum`. Establish the square-summability characterization and dense finite-support vectors through that API, without another generic family carrier. SelfAdjointSpectralTheory SA-B72 owns the direct-sum representation/PVM construction and SA-B80 the bounded-operator direct sum; this product-space application consumes them only for those operator constructions. The `ℓ²` topology is not the Tychonoff product topology.

Dooley p.8 leaves its “product space” and topology unspecified. QF1.P adopts these precise product targets and distinguishes them from the historical extension question; it does not attribute the Tychonoff interpretation to the scan. Dooley p.1 prints Mackey→Segal and cites Gudder–Boyce (1970), whose Theorem6.1 instead constructs Segal→weak Mackey under the full-state hypotheses of QF1.S.GudderBoyce. Preserve the printed arrow as a source claim and prove the actual cited direction above. Pulmannová (1978) uses the separate Segal→Mackey embedding definition and gives the necessary/internal results above. Neither result supplies an unrestricted converse or a sufficiency theorem for Pulmannová's embedding conditions. The Segal state contract makes real linearity explicit, which Dooley's printed state definition omits while its proofs use it; it likewise makes the printed implicit zeroth/first power conventions explicit.


## Milestone QF2 — projection logic and Gleason

Consume VonNeumannAlgebras V2's projection lattice, closed-subspace order, meet, join,
complement, orthogonality and orthogonal-projection APIs. Prove the orthomodular law and the
operational meanings of meet, join and complement. State the Boolean algebra laws only on a
commuting family.

**QF2.ModularityComparison.** The lattice of closed subspaces of an
infinite-dimensional Hilbert space is not modular by
VNA V2.NonmodularProjectionLattice. Consume V5.LatticeFinite for
the separate all-cardinality modularity iff finiteness theorem;
QF3.G.Type consumes its lattice-only type criteria. This later comparison
is not an input to the finite QF2.Frame theorem below.

A probability on projections is a function on `ClosedSubmodule(H)` with values in `[0,1]`,
normalized at `⊥, ⊤`, and finitely additive on orthogonal binary joins. Countable additivity is
a separate hypothesis: for every pairwise orthogonal sequence `(Vₙ)`,
`m(⨆ₙ Vₙ)=∑'ₙ m(Vₙ)`, where `⨆` is the closed linear span and the right side is a scalar
`tsum`. If projections are represented as operators, their countable sum is convergence in the
strong operator topology (SOT), not a norm-topology `tsum`. For arbitrary Hilbert dimension,
complete additivity means `m(⨆ᵢ Vᵢ)=sup_{F finite} ∑_{i∈F}m(Vᵢ)` for every orthogonal family.

**QF2.Frame.** Prove Gleason for finite-dimensional complex Hilbert spaces of dimension at least three; QF2.GeneralGleasonAndDensity below owns the infinite-dimensional extension. The finite-dimensional
frame-function theorem is a QF target: for `n≥3`, a bounded nonnegative function on the unit
sphere of `ℂⁿ` whose sum over each orthonormal basis is the same constant is induced by a unique
positive Hermitian operator. The harmonic proof must use the complex sphere `S^(2n−1)` with
phase-invariant functions, not silently use the real `S²` calculation. Build the phase-invariant
harmonic decomposition and completeness, compute the averaging operator over orthonormal frames
on each harmonic component, prove the eigenvalue formulas and identify exactly the constant and
Hermitian-quadratic kernel. Retain the arbitrary finite frame weight `w`: prove `w≥0`, identify it with the trace of the positive representing operator, and derive the probability case by `w=1`. For `w>0`, division by w gives the normalized frame function and multiplication by w recovers the original; for `w=0`, nonnegativity forces the frame function and representing operator to vanish. Include dimension zero separately, where the empty-basis identity forces w=0. These weight and normalization APIs do not change the dimension-at-least-three hypothesis of the Gleason classification. Supply a proof of the regularity/continuity needed for that harmonic
argument; boundedness alone is not continuity. Alternatively, if the real `S²`/Legendre-polynomial
proof is used, also prove the theorem that transfers its real quadratic form from every real
orthonormal triple to a Hermitian form on `ℂ³`; the transfer is not implicit. Polarization recovers
the off-diagonal matrix entries. Consume QF2.ElementaryBloch’s sgn example for the dimension-two exception, and prove the dimension-one case.

**QF2.ElementaryBloch.** Own the two elementary dimension-two boundary examples, independently of V12.J. The first is the antipodal sphere bijection
`(x,y,z)↦(x,y,2z)/sqrt(x²+y²+4z²)` preserves orthogonality of rays but changes
transition probabilities. Prove it pulls some Born normal state back to a
non-Born frame function by checking the three coordinate-axis values and a
non-axis direction. QF5 and V12.J consume this example; they do not re-own it.

In dimension two, exhibit the Bloch-sphere counterexample: for a rank-one projection with unit
Bloch vector `n`, let `f(n)=1/2+(1/4)sgn(n₃)`, with `sgn(0)=0`; antipodal orthogonal rays sum
to one, but this is not induced by a density matrix.

**QF2.GeneralGleasonAndDensity — infinite-dimensional Gleason and density states.** Consume QF2.Frame, V0, CStarAlgebras C2’s pure-state/GNS theory, V4.Core’s trace pairing and trace-class norm identities, V4.Normality’s normal-state/vector-functional decomposition, QF2.PositiveDensitySpectralAdapter below, and OperatorIdeals Parts A–B. This submilestone is separate from QF2.ElementaryBloch and is not an input of QF5.Core or QF5.P.

For separable infinite-dimensional `H`, define `q(v)=‖v‖²m(ℂv)` for all `v`, with `q(0)=0`.
For every finite-dimensional subspace `V` of dimension at least three, the finite theorem gives a
unique positive `T_V` with `q(v)=⟪v,T_Vv⟫` on `V`; its trace is `m(V)`. Uniqueness proves
compression compatibility `T_V=P_V T_W|_V` whenever `V⊆W`. Any finite list of vectors lies in a
finite-dimensional subspace of dimension at least three, so compatibility proves `q` is a
Hermitian quadratic form on all of `H`; `0≤q(v)≤‖v‖²` gives boundedness. Riesz representation
gives a positive contraction `T`. Countable additivity on an orthonormal basis shows
`Σₙ⟪eₙ,Teₙ⟫=1`, hence `T` is trace class and has trace one. For every closed subspace `V`,
apply the finite theorem to finite-dimensional subspaces of `V` and countable additivity over an
orthonormal basis of `V` to prove `m(V)=Tr(TP_V)`. This establishes the result on projections
outside any one chosen dense union without assuming continuity of `m` as a function of projections.
Prove uniqueness from equality of quadratic forms.

For nonseparable `H`, prove only the complete-additivity version. Finite-subspace restrictions
again construct a bounded positive form; complete additivity on an orthonormal basis makes the
resulting positive operator trace class with trace one. Sequential additivity alone is not the
hypothesis for this full-cardinality conclusion. For a unit vector `ψ`, verify
`mψ(V)=‖P_Vψ‖²=⟪ψ,P_Vψ⟫` and derive its countable additivity from orthogonal SOT sums.

**QF2.PositiveDensitySpectralAdapter — positive trace-class eigen-expansion.** On an arbitrary complete complex Hilbert space `H`, including nonseparable `H`, own the following density-state adapter to the existing native compact self-adjoint spectral theorem. Consume OperatorIdeals `OI-B29`–`OI-B30`: finite trace-class gauge makes the approximation-number sequence summable, hence tending to zero; `OI-A29` supplies compactness. Positivity supplies symmetry of the underlying linear map. Apply [`ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Analysis/InnerProductSpace/Spectrum.lean#L119-L124), whose hypotheses are compactness and symmetry on a complete inner-product space, with no separability or injectivity premise. Use its Hilbert basis indexed by a set of vectors, retaining the possibly nonseparable zero eigenspace. Positivity makes all eigenvalues real and nonnegative; Mathlib's `ContinuousLinearMap.finite_dimensional_eigenspace` makes each nonzero eigenspace finite-dimensional. Consume the native `ContinuousLinearMap.hasSum_smul_repr_of_apply_eq_smul` for the pointwise eigen-expansion.

For every positive trace-class `ρ`, use V4.Core's basis-independent positive extended trace to prove that the sum of its eigenvalues, counted with multiplicity, is `Tr(ρ)<∞`. Its positive-eigenvalue eigenvectors therefore form an orthonormal family `(ψ_i)_{i∈I}` with finite or countable index `I`; this does not assert countability of a basis of `H`. Write `P_i x=⟪ψ_i,x⟫ψ_i` and the corresponding eigenvalues as `λ_i>0`. For every finite `F⊆I`, prove the positive trace-class remainder and the exact tail identity
`‖ρ−Σ_{i∈F}λ_iP_i‖₁=Tr(ρ−Σ_{i∈F}λ_iP_i)=Σ_{i∈I\F}λ_i`.
Derive the positive trace/norm equality from V4.Core's isometric trace pairing, trace cyclicity and V0's positive-functional norm-at-one formula. Thus the finite-subset net converges in trace norm to `ρ`; any enumeration of an infinite `I` gives the corresponding trace-norm series. Include finite `I`, `ρ=0` and zero `H`, without requiring an infinite orthonormal family or an injective density operator.

For `Tr(ρ)=1`, obtain `Σ_iλ_i=1` and, for every bounded operator `A`, the normal-state identity `Tr(ρA)=Σ_iλ_i⟪ψ_i,Aψ_i⟫`, with absolute convergence bounded by `‖A‖Σ_iλ_i`. Consume V4.Normality's countable vector-functional decomposition for the normal-state comparison. QF2 owns this positive-density eigenbasis/state interpretation; the generic compact self-adjoint theorem remains native, and the broader compact-normal SA-C86 target retains its separate full scope. This adapter is distinct from Gleason and from arbitrary state convex-decomposition claims for infinite-dimensional C*-algebras. Consume V0 for the common state carrier, C2 for pure-state/GNS facts, OperatorIdeals Parts A–B for trace class and compactness, V4.Core for the trace pairing, and V4.Normality for the normal-state decomposition.

## Milestone QF3 — measurement, expectation and dynamics

Consume SAST's unbounded self-adjoint spectral PVM and uniqueness, plus V10.ClosedOperators' multiplier-form
unitary representation. Consume the OperatorTheory/UnboundedOperators dependency contract for
the unbounded Borel calculus, PVM/self-adjoint correspondence, spectral families and multiplication
operator representation. QF proves the outcome law for bounded Borel functions and vector/normal
states, its measurable pushforward and expectation identities, and the unbounded first-moment
expectation when ∫|λ|dμψ is finite. Membership in `D(A)` is exactly `∫λ² dμψ<∞`; the quadratic-form domain is separately identified with `∫|λ| dμψ<∞`.

For bounded Borel `f`, prove that expectation in a vector or normal state equals the integral of
`f` against the outcome measure and agrees with the bounded operator calculus. Define the
unbounded expectation only when the absolute first moment exists. For a vector state this
condition is exactly `ψ∈D(|A|^(1/2))`, the quadratic-form domain; it need not imply `ψ∈D(A)`. Prove expectation linearity for all bounded observables in a fixed state,
variance nonnegativity for normalized `ψ∈D(A)` (where `D(A)` is characterized by the finite second spectral moment above), and the following uncertainty statements with their domains explicit.
For normalized `ψ∈D(A)∩D(B)`, let `a=⟪ψ,Aψ⟫`, `b=⟪ψ,Bψ⟫`, and
`ΔψA=‖(A−a)ψ‖`; prove
`ΔψA·ΔψB ≥ |Im⟪(A−a)ψ,(B−b)ψ⟫|`.
The commutator form `ΔψA·ΔψB ≥ ½|⟪ψ,[A,B]ψ⟫|` requires
`ψ∈D(AB)∩D(BA)` and that the displayed commutator be defined there. Equality in the form
inequality requires `(A−a)ψ=iμ(B−b)ψ` for real `μ`, with zero-variance cases treated
separately; arbitrary real proportionality is not an equality criterion. Give Gaussian
position/momentum minimizers. Consume UO-E01 for the source exercise `[A,B]=iC*C` and its exact
common-domain eigenvector implication `Cψ=0`; QF3 supplies the corresponding state-expectation
interpretation.

**Repeated uncertainty and dynamics source comparisons (Grundling pp.161–162,168).** Consume QF3's normalized variance, common-product commutator, imaginary-proportionality and zero-variance equality statements above. In p.161, `‖(A−a)ψ‖²=∫(λ−a)²dμ_ψ` needs only ψ∈D(A); the displayed strong vector `(A−a)²ψ` additionally needs ψ∈D(A²), or else its expectation must be read as the associated quadratic form. The already specified multiplier example ψ(x)=(1+|x|)⁻² belongs to D(M_x) but not D(M_x²). The source's a=⟨ψ,Aψ⟩ is the normalized-state expectation only when ‖ψ‖=1; otherwise divide by ‖ψ‖² for a nonzero vector. Preserve its real-proportionality equality claim separately from the true imaginary proportionality and zero cases. For the abstract source `[P,Q]ψ=iψ`, the homogeneous commutator lower bound is `½‖ψ‖²`, not its recorded `½‖ψ‖`; the unit-vector version is½. Scaled centered Gaussian minimizers with0<‖ψ‖<1 distinguish those formulas. Exclusion of nonzero individual or joint eigenvectors applies on the actual commutator product domain. Keep that source CCR sign separate from QF's physical `[P,Q]=−iI` convention. The p.168 equation `−iψ′=iHψ` instead gives ψ′=−Hψ, with norm decay already for H=I; it is not the adopted physical `iψ′=Hψ` or positive Stone derivative ψ′=iAψ. These are source comparisons using the existing variance/dynamics owners, not new observables or a second evolution theory.

Fix the Fourier convention `Ff(ξ)=∫f(x)e^(−2πix·ξ)dx`, position `Qf=xf`, and momentum
`P=−i∂` on its self-adjoint Sobolev domain, so `FPF⁻¹=M_(2πξ)`. State the translation and
Weyl signs derived from this convention. Give the finite Pauli example and derive invariance of
outcome laws under simultaneous unitary transport. Under `U(t)=e^(itA)` use SAST's Stone
convention; physical evolution `e^(−itH)` corresponds to `A=−H`. Model a channel evolution by
normal unital CP maps `Φ_t:B(H)→B(H)` with `Φ_0=id`, semigroup law and pointwise ultraweak
continuity, or by its trace-preserving predual; do not conflate it with unitary evolution.

For a von Neumann algebra model, define central sector projections with strong
sum one and prove the chosen sector decomposition splits block-diagonal
observables and normal states. Arbitrary labels or a Hilbert-space decomposition do not by themselves define superselection sectors: their projections must be central in the specified observable algebra. On the bounded product von Neumann algebra
`M=∏ᵢ B(Hᵢ)`, with nonzero complex Hilbert spaces `Hᵢ`, prove that pure normal
states are exactly unit-vector states supported in one sector; this normal-state
theorem has no dimension restriction. Prove also the logic-measure statement
used in Dooley p.10: for countably many separable sectors with every
`dim Hᵢ=1` or `dim Hᵢ≥3`, each countably additive probability measure on `P(M)`
comes from a unique normal state. Prove it by restricting to sectors, applying
QF2.Frame in each finite-dimensional sector of dimension at least three and QF2.GeneralGleasonAndDensity in each infinite-dimensional separable sector, treating dimension one
directly, and summing the sector weights. Its extreme points are precisely the
unit-vector measures in one sector. For arbitrary sector index sets and
nonseparable sectors, state and prove the corresponding completely additive
version, using QF2.Frame for finite-dimensional sectors, QF2.GeneralGleasonAndDensity’s separable theorem for infinite-dimensional separable sectors and its full-cardinality theorem for nonseparable sectors, with additivity over arbitrary orthogonal families. Keep this stronger
additivity hypothesis explicit. Dimension-two sectors admit non-Born logic
measures and are excluded only from the Gleason identification, not from the
normal-state classification. Preserve Dooley p.10's literal assertion that a self-adjoint `A` is an observable iff `A(M_i)⊆M_i` for every listed sector. For arbitrary subspaces this only says they reduce `A`; it does not make their projections central in the chosen von Neumann algebra. For the full block observable algebra `𝒜=∏ᵢB(M_i)` acting on `⊕ᵢM_i`, with mutually orthogonal sector projections of strong sum `1`, prove that its bounded self-adjoint operators are exactly the bounded self-adjoint operators preserving every `M_i`. These projections are central in this specified algebra. For a proper von Neumann subalgebra with the same central projections, sector preservation alone need not imply membership in the observable algebra; retain the membership condition separately, including in the multiplicity model below. For unbounded affiliated observables, include domain invariance under the central projections. Do not promote the source's assertion without its centrality hypothesis. In a representation with multiplicities `⊕ᵢ(Hᵢ⊗Kᵢ)`, the algebra acts as `B(Hᵢ)⊗1`; a vector in one sector induces a pure state exactly when its reduced state on `Hᵢ` has rank one. Thus sector support alone does not imply purity for an entangled vector with multiplicity.
Include finite-outcome coarse-graining, finite-valued functional calculus and
measurable pushforward of outcome measures.

### QF3.G — general von Neumann operational models and their types

**QF3.G.Model.** For each nonzero complex W*-algebra M, consume
V0/V1/V2 and V4.Core/V4.PositivePredual/V4.Normality, including V4.Core's faithful
ultraweakly continuous concrete representation inducing the given predual. Take questions P(M)={p∈M:IsStarProjection p},
states all normal positive normalized functionals from V0’s state carrier with V4.Core’s normality predicate and V4.Normality’s comparison theorems,
and observables all real Borel PVMs with values in P(M). Define
`p(E,ω,B)=ω(E(B))`. Prove the Mackey probability, separation, countable
orthogonal-additivity, order-fullness and countable-mixture laws; vector
functionals in a faithful normal representation prove order determination.
The bounded observables are exactly M_sa through the supplied bounded Borel
spectral calculus. Consume V10.Affiliation's pre-tracial self-adjoint/PVM comparison, with its
actual domains, to identify the full real PVM carrier. Preserve Dooley p7's literal 'weakly dense' phrase as source text: weak
density does not make a unital star subalgebra a VNA. For infinite H,
K(H)+ℂ1 is a proper weakly dense example; use actual ultraweak closure/
WStarAlgebra as the model condition. V1's bicommutant theorem proves the
weak-density example. This includes typeII,
typeIII and nonfactor algebras; no trace-class-density or pure-normal-state
parametrization is imposed on all M.

State a VNA presentation of an abstract operational system as an actual logic
orthoisomorphism to P(M), an affine bijection onto the full normal state space,
and a bijection onto these PVMs, preserving every evaluation and Borel
pushforward. Build identity/composition and evaluation transport for these
presentation maps here; QF5.G owns their Jordan comparison. A selected proper state family or observable family retains its explicit
image and stabilizer conditions; the full-normal-state reconstruction theorem
is not asserted for such a family without its hypotheses.

**QF3.G.Type.** Consume V3/V5/V6, including V5.LatticeFinite and
V6.LatticeTypes, with no V12.J input.
Consume the algebraic type and central-projection theory with no separability
restriction. Consume V6.LatticeTypes for the logic center and its splitting property
`q=(q∧z)∨(q∧z′)` for every q, identified with P(Z(M)). Hence M is a factor
iff its logic center is {0,1}. For a nonzero factor, typeI is equivalent to
existence of an atom/minimal projection; typeII has no atoms and has a nonzero
finite projection; typeII₁ has finite identity; typeII∞ has infinite identity
and a nonzero finite projection; typeIII has no nonzero finite projection.
Here finiteness is V3/V5's Murray–von Neumann finiteness, not finiteness of a
set. Consume V6.LatticeTypes to express these alternatives internally: finite
means [0,p] modular, and abelian means [0,p] Boolean. Thus typeII₁ is
atomless/modular, typeII∞ atomless/nonmodular with a nonzero modular interval,
and typeIII has no nonzero modular interval. Atomlessness alone does not
distinguish II from III. For general M, typeI means every nonzero q
dominates a nonzero e with [0,e] Boolean. The one-atom criterion is invalid
for every general nonfactor, not merely diffuse-center examples: ℂ⊕R_II1
has an atom and atomic center but is not typeI. With atomic center use the
criterion on every minimal central summand. Consume the intrinsic I₂
central-part criterion, rather than asserting type transport without it. Consume the same owner for
P(M) Boolean iff M abelian. Consume V6.LatticeTypes' intrinsic z_I, z_sf
and z_fin formulas for the I/II/III central parts and their I_n/II₁/II∞
refinements, together with that owner's identification with the algebraic type decomposition. Consume V6's factor-fibre type theorem under precisely
V4.0.Decomposition's separably acting/standard-base hypotheses; arbitrary M retains the central-projection decomposition, without an
unjustified measurable-fiber claim.

**QF3.G.TypeExamples.** Consume QF3.G.Model, QF3.G.Type, V6, V8, V10,
V11 and V13. Give
operational models for B(H), the II₁ group factors in V8, their II∞
amplifications from V6, and V10/V11's Powers typeIII examples. Give both
finite direct-sum and diffuse-center nonfactor examples, consuming the
existing algebra constructions. Distinguish type decomposition from
isomorphism classification of factors: V13's injective/separable-predual
classification applies only with those hypotheses. Dooley p7's logic-only projection-model assignment remains separately
recorded, including the IV′ sublattice versus full-model distinction; MO₂
excludes a universal full-model assertion, not IV′. State-space
representability has known intrinsic characterizations and is owned by
QF3.G.StateGeometry below as a project theorem target. Neither statement
classifies every typeII/III factor or every abstract operational system.

**QF3.G.ProjectionStates.** Consume V12.J.Scalar: for M with no typeI₂
central summand, completely orthogonally additive probability measures
on P(M) are exactly its normal states; for sigma-finite M countable
additivity suffices. Keep complete and countable versions distinct in
arbitrary cardinality. This is a terminal .G consequence, not an input
to QF2.Frame or the raw full-normal-state Model construction.



**QF3.G.StateGeometry — the full operational representability criterion.**
Keep the logic-only representation assignment separate from the known
normal-state-space characterization problem. Neither is a classification of
all typeII/III factors. Own the following explicit algebraic iff for the full
operational model, not just a state-space encoding.

For a separated abstract system (L,S,O,p) with S≠∅ and its probability
axioms, form the real ordered span of its state functions and its generated
positive cone with the base seminorm. Quotient zero seminorm and complete
to V, taking V⁺ to be the closure of the image of that cone. Require that
the completion norm is the base norm for this closed cone. Let u be the
mass functional and A=V* with its dual norm. The criterion
requires that S injects and is exactly the norm-complete positive mass-one
base of V; it does not silently add completion states to the original system.
The evaluation e_q(s)=s(q) must extend to A and give an order/complement
isomorphism of L onto the extreme points of [0,u]. The map
`O→{real-Borel, countably orthogonally additive extreme-effect-valued measures}`,
`E↦(B↦e_(E(B)))`, must be bijective and preserve Borel pushforward. Require
E(∅)=0, E(ℝ)=u and countable orthogonal additivity in σ(A,V), where
orthogonality of extreme effects means e+f≤u. Probability
is its evaluation on S. These are intrinsic projection/PVM/evaluation
conditions on the given operational system, not hypotheses that a desired
von Neumann algebra already exists. Selected proper families retain their
specified images instead of claiming this full-model iff.

The remaining condition is existence of the following maps on A: a continuous unital
real commutative Jordan product ∘, with unit u, native `IsCommJordan`,
`||a∘b||≤||a||||b||`, `||a²||=||a||²`, `||a²||≤||a²+b²||`, positive cone
exactly the squares, and separately σ(A,V)-continuous multiplication; and a
bounded real-linear map `ψ:A→(A→L[ℝ]A)` such that each ψ_a is a weak-star
continuous skew order derivation. Spell this out as ψ_a(u)=0 and
`exp(tψ_a)` preserving the positive cone in both directions for every real t,
with the two identities

```
[ψ_a,ψ_b]=−[L_a,L_b],   L_a(b)=a∘b,   ψ_a(a)=0.
```

The cited Alfsen–Shultz convention writes its product as a∘b−iψ^AS_b(a).
Use the adapter ψ^AS_a=−ψ_a: antisymmetry gives ψ^AS_b(a)=ψ_a(b),
so the two reconstruction formulas coincide. The two displayed dynamical
identities are invariant under this simultaneous sign change.

These are JB/JBW and dynamical-correspondence conditions with explicit maps,
not a proposition field asserting representability. Prove that the original
system has a full nonzero complex VNA presentation iff there exist ∘ and ψ
satisfying all these conditions.
For necessity identify V with the real self-adjoint normal predual by
V4.PositivePredual and A with M_sa, and take
`ψ_a(b)=(i/2)(ab−ba)`. Derive directly
`[L_a,L_b]c=¼[[a,b],c]` and
`[ψ_a,ψ_b]c=−¼[[a,b],c]`; this fixes the dynamical sign. The exponential is conjugation by exp(ita/2), so it is
normal, positive and unit preserving.

For sufficiency own the JB/JBW dynamical-correspondence reconstruction from
[Alfsen–Shultz, Theorem1 and Corollary2](https://pmc.ncbi.nlm.nih.gov/articles/PMC22571/).
Polarize ψ_a(a)=0 to obtain ψ_a(b)=−ψ_b(a), prove the order derivations are
Jordan derivations, and define on A+iA the complex-bilinear product
`a·b=a∘b−iψ_a(b)` and involution `(a+ib)*=a−ib`. Prove associativity using
the displayed bracket identity and derivation laws. For x=a+ib compute
`x*x=a²+b²+2ψ_a(b)`. Prove this lies in the given positive cone and that
`||x||=||x*x||^(1/2)` is a complete C*-norm extending the dual JB norm;
positivity, triangle inequality and the C*-identity are required analytic
steps of this reconstruction, not consequences of a formal product formula.
Prove the C*-unit ball is closed for the specified dual pairing and that
the complexified predual norm is its polar norm; merely having a separate
weak-star continuity formula is not a proof that the new C*-norm is a dual
norm. Use this duality, the specified weak-star continuity and predual V to prove the completed
algebra is a W*-algebra, identify its normal self-adjoint predual with V,
and its full normal-state base with the original S. Extreme effects are
its projections by V12.J.Enriched's elementary effect lemma; the criterion's e and
observable bijections now give the actual projection/PVM/evaluation
presentation. Conversely recover these exact data from every full VNA
presentation. A given ψ fixes the associative product uniquely; existence
of some ψ does not choose a unique associative orientation. The criterion
asserts existence of a full presentation; its two-presentation uniqueness
theorem is separately owned by QF5.G.Presentation.

**QF3.G.SpectralGeometry — intrinsic normal-state bases.**
On the real Banach base-norm space V above, require a closed pointed generating
cone V⁺ and continuous mass functional u, strictly positive on V⁺\{0}, with
nonempty base K={v∈V⁺:u(v)=1} and

```text
‖v‖=inf{u(x)+u(y):x,y∈V⁺, v=x−y}.
```

Use the dual order and dual norm on A=V*, with order unit u. Prove its
identification with all bounded affine real functions on K, by restriction
and unique linear extension. Use σ(A,V) as the weak-star topology. No
compactness assumption on K is made.

For a positive linear projection P write ker⁺P=ker(P)∩A⁺ and
im⁺P=P(A⁺). Projections P,Q are quasi-complementary when
ker⁺P=im⁺Q and im⁺P=ker⁺Q. A P-projection is a weak-star continuous
positive contractive projection P on A with a unique such projection P′
quasi-complementary to P, whose preadjoints P_*,P′_* on V are also
quasi-complementary on V⁺. Both positive range/kernel conditions on both
sides of the dual pairing are required. Include P=0 and P=I. Define the
projective face F_P=K∩im(P_*) and its quasi-complement F_P#=F_(P′).
The norm-exposed faces are {k∈K:a(k)=0} for a∈A⁺. Positive a,b∈A are
orthogonal when a vanishes on some projective face F and b on F#.

Spectral duality means every norm-exposed face is projective and every
a∈A has a unique decomposition a=a⁺−a⁻ into orthogonal positive parts.
Construct the projective-face/projection correspondence, its complete
orthomodular lattice and the spectral resolution and functional-calculus
API from these conditions. These are the explicit conventions in
[Alfsen–Shultz, *State Spaces of Jordan Algebras*, §2, pp158–159](https://doi.org/10.1007/BF02392307),
used by [Iochum–Shultz, §1, p318](https://doi.org/10.1016/0022-1236(83)90008-3).
Ellipticity means exp(t(P−P′)) is positive for every P-projection P and
every real t. Prove its equivalence to the full-ellipse containment
definition in their Definition1.2, and to both Proposition1.8 formulas

```text
|((I−P−P′)a)(k)|≤2 sqrt((Pa)(k)) sqrt((P′a)(k))   (a≥0,k∈K),
P(Q−Q′)P′=0                                      (P,Q P-projections).
```

Prove Theorem1.5: these spectral and elliptic conditions are equivalent
to a JBW product on A with this cone, dual norm and normal-state base K.
Build its product and separately weak-star continuous Jordan API, identifying
P-projections with quadratic representations U_p. This is the normal-state
criterion; the paper's compact/strongly-spectral JB-state-space corollary
has different hypotheses.

For the following face geometry use norm-closed faces, adjoining the empty
face to their lattice. Prove their projective-face/corner correspondence in
the JBW normal-state realization, including the zero/empty endpoints.
For F=F_(U_p), put p′=u−p and define its projective reflection by
R_F=(2(U_p+U_(p′))−I)_*|K. Prove it is an affine involution fixing
co(F∪F#). Orthogonality of projective faces means p∘q=0; equivalence
means transport by a finite product of projective reflections.

A nonempty normal-state base C is a global3-ball when there is a surjective
affine map φ:C→B³, the closed Euclidean unit ball, for which inverse image
is a face-lattice embedding and the prescription
R_F↦R_(φ⁻¹(F)) extends to an injective homomorphism
Aut_aff(B³)→Aut_aff(C). Keep the full group Aut_aff(B³)=O(3).
Its prescribed projective reflections are half-turns generating SO(3);
they alone do not determine the extension on orientation-reversing elements.
No additional φ-equivariance equation for those elements is imposed by this
definition. The global3-ball property requires F∨G to be a global3-ball
for every pair of nonempty orthogonal equivalent faces F,G. State and
prove the same property on the corresponding nonzero idempotents; do not
include the empty-face pair in this quantifier.

Prove Iochum–Shultz Theorems2.9–2.10 with these explicit face conventions:
within JBW normal-state bases the global3-ball property is equivalent to
being the self-adjoint part of a complex von Neumann algebra. In particular
the spectral, elliptic and global3-ball conditions characterize affine
isomorphism with {φ∈M_*:φ≥0,φ(1)=1} for some nonzero M. Prove the affine
maps extend to positive mass-preserving linear isometries of the base-norm
spaces; do not assume compactness or a Banach-weak compactness conclusion.

In the necessity proof, an orthogonal equivalent pair of projections gives
a corner M₂(B), with nonzero complex von Neumann algebra B. Restriction
of states to M₂(ℂ)⊗1 supplies φ and its face/reflection identities. Prove
the full O(3) extension, rather than tensoring an arbitrary Jordan
automorphism with id_B: partial transpose need not be positive. Use
O(3)=SO(3)×{±1}, via g↦((det g)g,det g), and the standard conjugation
action of SO(3) on the first matrix factor. If B is noncommutative,
choose a noncentral projection q; Ad(1⊗(2q−1)) is a nontrivial involution
commuting with this SO(3), with trivial intersection with its image.
If B is commutative, use the commuting spin-flip involution
J(a)=Tr₂(a)I₂−a, with the unnormalized B-valued matrix trace. Prove it
is a normal Jordan automorphism and restricts to Bloch inversion. These
give faithful extensions in both cases. On states use inverse pullback
so that the induced action is a homomorphism. Prove the global3-ball
corner reconstruction and the converse JBW characterization as well.

This criterion asserts existence of an associative presentation; it does
not choose its orientation. Prove its equivalence with existence of the
Jordan product and dynamical correspondence in QF3.G.StateGeometry,
retaining that criterion's separate projection, observable and evaluation
bijections. State-space geometry alone does not assert those operational
presentation conditions for an arbitrary selected system.

**QF3.G.ConeComparison — oriented Hilbert cones.** Consume
QF3.G.StateGeometry, V4.PositivePredual and V11's standard form and
Kadison–Sakai bounded-derivation innerness. For a cone C in a complex Hilbert
space, consume V10’s complex self-duality convention, namely
`C={η:for every ξ∈C, ⟨ξ,η⟩ is real and nonnegative}`. Prove the real-form
bridge: `E=closure(C−C)` is a real Hilbert space with the restricted real
inner product, C is self-dual in E for that real product, `H=E⊕iE`, and `J(ζ+iη)=ζ−iη`. For η∈E the pairings with ξ∈C are real, so the real dual inside E equals the complex dual intersected with E, namely C. In V11's standard form this
conjugation is exactly its J, since J fixes the natural cone. Apply this
bridge both to that natural cone and to the completed cone of Theorem5.8.
Self-duality for `Re⟨·,·⟩` on the whole underlying real space of H is a
different condition. Let C be a closed self-dual cone
in a real Hilbert space E, H its complexification and J its real-form
conjugation. For each closed face F let F⊥ be its orthogonal face and P_F
its closed-span projection. Define facial homogeneity by
`exp(t(P_F−P_(F⊥)))C=C` for every F and real t. For a facially homogeneous C,
put `D(C)={δ∈B(H):exp(tδ)C=C for all real t}`. Prove this is a real
involutive Lie algebra, that its Lie centre Z(D(C)) is star stable, and that
star descends to `Dbar=D(C)/Z(D(C))`. An orientation is a real-linear I
on Dbar satisfying `I²=−Id`, `[Ix,y]=[x,Iy]=I[x,y]` and
`I(x*)=−(Ix)*`. Own
[Connes, Theorem5.2](https://aif.centre-mersenne.org/item/AIF_1974__24_4_121_0/):
define the operator set

```
M_I={δ−iε:δ,ε∈D(C), [ε]=I[δ] in Dbar}.
```

Prove M_I is a von Neumann algebra, prove its actual operator commutant is
`(M_I)'={δ+iε:δ,ε∈D(C),[ε]=I[δ]}=JM_IJ`, and prove
`xJxJ C⊆C` for every x∈M_I. If ξ∈C is strictly positive, meaning
`η∈C and ⟨η,ξ⟩=0 ⇒ η=0`, prove ξ is cyclic and separating for M_I,
`J=J_(ξ,M_I)`, and C is its natural cone. This vector is not an existence
premise of the general-cone theorem. In the scalar-ray case Dbar=0 and
M_I=ℂId; the orientation acts on the quotient.

Conversely, for any von Neumann algebra M, use its V11 standard form
`(M,H,J,P)` without a countable-decomposability assumption. Own the following
standard-form facial and derivation comparisons here, consuming V11 innerness:
closed faces of P are exactly `F_e=eJeJ P` for projections e∈M, with
`P_(F_e)=eJeJ` and
`P_(F_e)−P_(F_e⊥)=(e−1/2)+J(e−1/2)J`. Prove facial homogeneity and prove
that the real-linear map `Φ:M→D(P)`, `Φ(x)=x+JxJ`, is onto, has kernel
`iZ(M)_sa`, and identifies the operator sets `Z(D(P))=Z(M)_sa`.
Prove the quotient formula

```
I_M[Φ(x)]=[Φ(ix)]=[i(x−JxJ)]
```

is well defined and is an orientation, and prove
`M_(I_M)=M` and `M_(-I_M)=M'=JMJ`. In the first equality
`Φ(x)−iΦ(ix)=2x`; in the second the sign reverses. Include arbitrary centres
and non-countably-decomposable summands. These face, projection and derivation
identities are targets of this comparison. For every full presentation
furnished by QF3.G.StateGeometry, apply this construction to its reconstructed
algebra and chosen associative product. Prove recovery of that algebra and
transport back by `q↦F_(e(q))` on questions, `ω↦ξ_ω∈P` on normal states, and `E↦(B↦F_(e(E(B))))` on observables, with ξ_ω the unique cone vector representing the reconstructed normal functional ω. The affine state correspondence is recovered through `ξ↦ω_ξ`; the cone-vector parameterization `ω↦ξ_ω` itself need not be affine. The opposite associative product negates ψ and gives −I_M and the commutant M′.
This is a terminal comparison with the same full presentation; its earlier
existence proof does not consume ConeComparison.

Also own Connes' distinct Theorem5.8. Here an ordered complex vector space W
has a salient convex positive cone W_+ generating W as
`W=(W_+−W_+)+i(W_+−W_+)`; u is an order unit for its ordered real span.
To underlie a von Neumann algebra means a complex-linear order isomorphism
onto it carrying u to1. If a first order isomorphism sends u to h, prove h
is positive invertible and normalize by `x↦h^(-1/2)x h^(-1/2)` before applying
the unit-normalized form theorem. Then W underlies a countably decomposable
von Neumann algebra iff it
admits an autopolar Hermitian positive nondegenerate form s whose completed
positive cone is complex self-dual, facially homogeneous and orientable. Here s is
linear in its first variable and conjugate-linear in its second; with this
roadmap's Hilbert convention the completion map satisfies
`⟨η_s(x),η_s(y)⟩=s(y,x)`. Autopolar means `w↦s(·,w)` maps W_+ onto a face
of the positive algebraic dual cone. Identify W's original positive cone with
the pullback of the completed cone. Define countable genus of that completed
cone H_s^+ by countability of every orthogonal family of its nonzero vectors. Prove its
equivalence with existence of a strictly positive vector, and prove η_s(u)
is such a vector. Identify it with V4.PositivePredual's faithful-normal-positive-
functional criterion; for M≠0 it is also the faithful-normal-state criterion.
For the forward construction and each faithful normal positive functional φ,
with its cyclic separating GNS vector ξ_φ and modular operator Δ_φ, set

```
s_φ(x,y)=⟨Δ_φ^(1/4)yξ_φ, Δ_φ^(1/4)xξ_φ⟩.
```

Prove all displayed vectors belong to the stated domains, that completion of
the positive cone is exactly the V11 natural cone, and that this is the unique
autopolar normalized form with `s_φ(x,1)=φ(x)` (Connes, Theorem1.3).
The ordered-space equivalence retains countable decomposability; the operational
and general-cone constructions retain arbitrary cardinality.

## Milestone QF3.S — The full PVM carrier and all-state uniqueness

The prerequisites of this milestone are QF1.S, UnboundedOperators UO1 (especially UO-A01–A07 for unbounded integration, domains and moments), and SelfAdjointSpectralTheory's spectral PVM and uniqueness interfaces (SA-E01, SA-E44) plus bounded compatibility (SA-E45). SAST supplies the PVM; UO supplies its unbounded integral and moment-domain API. It has no NQS or RQFT prerequisite. The Mackey observable family now consists of **all** projection-valued Borel measures on `ℝ`, including unbounded support; prove Borel-calculus closure and proposition fullness. Extend QF1.S's bounded spectral map into this carrier and prove all three embedding clauses for the selected family of all normal states.

Own the following all-state first-moment lemma. If a PVM has unbounded support, choose disjoint bounded Borel bands `B_n⊆{|t|≥2^(2n)}`, `n≥1`, with nonzero projections, and orthogonal unit `ξ_n∈ran E(B_n)`. Construct the positive trace-class density `ρ=Σ_{n≥1}2^(−n)|ξ_n⟩⟨ξ_n|`, prove trace one and `∫|t|dTr(ρE(t))≥Σ_n2^n=∞`. Justify existence of the bounded bands by spectral countable additivity and continuity from below. Thus absolute first-moment integrability in **every** normal state forces bounded spectral support. Integrate a bounded-support PVM to a bounded self-adjoint operator; equality of its first moments with `T` in all vector states, followed by polarization and spectral uniqueness, gives `E=E_T`. Every expectation premise includes absolute integrability explicitly; a totalized integral's default value outside its domain supplies no premise. QF3.S also records the full unbounded operator/moment domains from its suppliers. QF1.S's bounded theorem does not consume QF3.S.



## Operator-theory dependency for source models

Consume SAST SA-E01–SA-E13 for the unbounded self-adjoint spectral PVM, domain-preserving
projections and spectral restrictions; SA-E26 and SA-E28–SA-E30 for the generated group, maximality, Stone uniqueness and
commutation with that group; and SA-E44–SA-E47 for PVM uniqueness, bounded compatibility
and multiplication-operator spectral projections. Consume V10.ClosedOperators' cyclic multiplier-form theorem
for the representation on L²(M,μ) with domain {g : ∫|fg|²dμ<∞}, and HilbertModules H6's
deficiency-space decomposition and self-adjoint extension classification. QF does not repeat
these targets.

The generic unbounded-operator theorems used by these models are supplied by
the linked [OperatorTheory/UnboundedOperators milestones](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e6264307d7a97c55c60e8dcf8736f677e77699c2/TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md#exact-supplier-contracts).
QF consumes its UO1–UO5 milestones with their full prerequisite table: SAST, V10.ClosedOperators and H6, the named bounded VNA interfaces, LieGroups smooth flows, VariationalMethods V2.3, and PDE weak-derivative/integration inputs for the specific targets listed there;
QF does not duplicate those operator-theory definitions.
The division of source examples is:

- UO1 owns the closed unbounded Borel calculus, exact domains and algebra laws, spectral
  integral, self-adjoint/PVM and spectral-family correspondences, multiplication representation
  and support/spectrum results.
- UO2 owns normal operators, strong commutation and joint PVMs, spectral types and essential
  spectrum.
- UO3 owns symmetric extensions and deficiency refinements over H6, maximal symmetric
  operators, analytic vectors and Nelson's theorem.
- UO4 owns relatively compact perturbations and the essential-spectrum consequences.
- UO5 owns closed tensor products/sums, their domains and the unitary evolution formula.

QF3 owns the state-dependent outcome law, first and second moments, expectation, variance and
uncertainty identities on those operator domains. QF4/QF6 own the concrete Fourier, particle,
oscillator, angular-momentum, hydrogen and tensor-state calculations, consuming the generic
operator APIs and the QF Fock-operator API. The Grundling theorem/exercise examples are allocated as
follows: Chapters 3–6 operator theorems, exam Q1, Q2(i–ii), Q3–Q5, Q6–Q8, Assignment 1's kernel and
nonclosability examples, `σ_p(g(A))=ℚ`, and `ix∂θ`, and Assignment 2's U(2) family, domain
counterexample, analytic vectors and Nelson direct/tensor sums are acceptance examples for UO1–5
under their stated domains. The probability and uncertainty interpretations of these examples
remain QF3/QF6 targets. Literal source claims with incorrect domains, signs or hypotheses remain
separate from corrected statements.

The exact UO target groups include:
- closed densely-defined normal operators; all self-adjointness equivalences, not one direction;
  point/continuous/residual spectrum and σᵣ(A)=∅ for self-adjoint A;
- essential spectrum; reducing decomposition into pure-point, absolutely-continuous and
  singular-continuous subspaces; pure-point staircase approximation;
- strong commutation of self-adjoint A,B iff their unitary groups commute; commuting
  n-parameter unitary groups on a common invariant core and their joint PVM;
- constancy of deficiency indices on each half-plane; spectrum alternatives for closed
  symmetric operators; closed symmetric extensions as partial isometries N₊→N₋ with the index
  formula; maximal symmetric operators; conjugation criteria; boundary values;
- Nelson analytic-vector theorem and its direct-sum/tensor-sum forms; Weyl's theorem for
  relatively compact perturbations;
- tensor products and tensor sums of closable operators, exact sum domains, the spectral-sum
  theorem under its hypotheses, and e^{it(A⊗1+1⊗B)}=e^{itA}⊗e^{itB} on the proved closures;
- the unbounded spectral calculus f(A), with domain {ψ : ∫|f|²dμψ<∞}, closedness, adjoint,
  sum/product domain laws, spectral integral A=∫λdP_A, PVM/self-adjoint bijection, spectral
  family/PVM bijection, multiplication-operator representation, support P_A=σ(A), and vanishing
  on resolvent sets. Prove every equality/inclusion and closure criterion with its actual domain.

The generic operator theorem targets include Grundling Theorems 3.6–3.8, 4.10–4.18,
5.2–5.14 and 6.1–6.3; exam Q1, Q2(i–ii), Q3–Q5 and Q6–Q8; Assignment 1 kernel operators, nonclosability
of R−N, σ_p(g(A))=ℚ, and ix∂θ; Assignment 2 the U(2) family for −d²/dx²,
V_t dom A⊄dom A, analytic vectors under extensions, and Nelson for direct/tensor sums; and
Problems I. The assignment/exam table records only actual question labels; no Q2(iii) is listed. For Assignment 2 Q1(i), the source computes deficiency indices `(2,2)` and a `U(2)` family; do not substitute `(1,1)`. The accompanying source's identification `U(2)/ℤ₂ = SU(2) ≅ SO(3)` and its claim of two disjoint copies of `SO(3)` are false and are retained as literal source errors. Source statements with incorrect domains or hypotheses remain separate from the
corrected theorems. QF3/QF6 consume these results for probabilities, uncertainty, Fourier,
oscillator, hydrogen and composite-system models.

## QF4 prerequisite — Fock-operator API on D8 carriers

D8 supplies CAR and Weyl algebras, their regular representations, bosonic/fermionic Fock carriers, CAR creation and annihilation, and the Weyl field operators with their invariant-domain commutator. QF does not rebuild those carriers or basic field operators. QF proves bosonic vacuum cyclicity and, for the fermionic Fock representation, vacuum cyclicity, the CAR occupation-number orthonormal basis and irreducibility; these properties are not attributed to D8. QF adds the generic second-quantization and domain-comparison API on the D8 carriers: `N=dΓ(1)`, `dΓ(A)`, `Γ(U)`, `Γ(e^{itA})=e^{itdΓ(A)}`, number spectrum and occupation basis; for bosonic creation/annihilation on `D(N^{1/2})`, record the domain mapping and bounds not already supplied by D8, namely
`‖a#(φ)ψ‖≤‖φ‖‖(N+1)^{1/2}ψ‖`. This domain need not be invariant under either operator.
Prove each operator maps `D(N)` into `D(N^{1/2})`, so both products in the CCR are defined
on `D(N)`; prove the CCR there and on the invariant algebraic finite-particle core.
For the source constructions on physical pp.105 and107–110, use V2's completed Hilbert tensor products to present the auxiliary unsymmetrized space `F_all(h)=⊕_(n≥0) h^(⊗n)`, with `h^(⊗0)=ℂ`, vacuum `Ω=(1,0,…)` and norm `‖ψ‖²=Σ_n‖ψ_n‖²`. For `h=L²(ℝ)`, identify its n-sector with `L²(ℝⁿ)` and prove the displayed sum-of-integrals norm formula. Compare the sector-projection direct sums with D8's shared symmetric and antisymmetric Fock carriers. For a one-particle unitary U prove `Γ(U)|_n=U^(⊗n)` and `Γ(U)|_0=1`, its direct-sum unitarity, commutation with total number and sector projections, and preservation of both sector carriers. For n≥1 define the bounded first-factor contraction `b̄_n(f)=⟨f,·⟩⊗1`, and set it zero on the vacuum. Prove the completed-tensor bound before taking the direct sum `b̄(f)`, its exact norm `‖b̄(f)‖=‖f‖`, its insertion adjoint `b̄(f)*η=f⊗η`, and its antilinear dependence on f. Prove the adjoint insertion depends linearly on f and `Γ(U)b̄(f)Γ(U)*=b̄(Uf)`.

**Second-quantization domains and cores (Grundling p.106).** For self-adjoint A on the complete one-particle space and a linear graph core D_e for A, let A_n be the self-adjoint closure of the independent n-factor tensor sum, with A_0=0 on ℂ. In the completed unsymmetrized sector H^(⊗n), put
`K_n=span_ℂ{v₁⊗⋯⊗v_n : v_j∈D_e}`, with `K_0=ℂ`.
This is the algebraic tensor core, before applying either permutation-sector
projection. On an elementary tensor the operator is
`Σ_(j=1)^n v₁⊗⋯⊗Av_j⊗⋯⊗v_n`; its linear extension is well-defined
by the tensor universal property. Consume UO-F02/F03's finite product-PVM
sum and tensor graph-core comparison to prove K_n is a graph core for A_n,
without requiring D_e analytic or invariant under A. Define the maximal
second quantization on the completed unsymmetrized Fock carrier by
`D(dΓ(A))={ψ:∀n, ψ_n∈D(A_n) and Σ_n‖A_nψ_n‖²<∞}`, with `(dΓ(A)ψ)_n=A_nψ_n`.
Prove this direct-sum operator is self-adjoint. Prove the finite-support vectors with `ψ_n∈K_n` form a graph core: first truncate the convergent ambient and image square sums, then approximate each of the finitely many retained components in its sector graph norm. Commutation with the permutation unitaries makes the symmetric and antisymmetric direct-sum projections preserve this domain and core. Prove that their restrictions are self-adjoint on the projected maximal domains and essentially self-adjoint on the projected finite tensor core. Distinguish the finite-particle space of vectors in completed sectors from this smaller algebraic tensor core. For A=I recover N on `D(N)={ψ:Σ_n n²‖ψ_n‖²<∞}`, its finite-particle core, and `D(N^(1/2))={ψ:Σ_n n‖ψ_n‖²<∞}`. The vacuum sector remains ℂ for the zero one-particle space; a permutation unitary on a zero positive-particle tensor sector has norm zero, while Γ(U) has norm one because it fixes the vacuum. Prove `Γ(e^(itA))=e^(itdΓ(A))` by the sector group identities and bounded direct sums.

Compare D8's creation and annihilation with the normalized sector formulas: on the n-sector, `a(f)=√n b̄_n(f)` for n≥1 and it kills the vacuum, while `a†(f)η=√(n+1)P_(n+1)(f⊗η)`, where P is the symmetric or antisymmetric projection as appropriate. Prove that the raw contraction maps into the corresponding (n−1)-sector. For a(f) on a projected elementary tensor prove the formula `n^(-1/2)Σ_k⟨f,f_k⟩P_(n−1)(f₁⊗⋯⊗hat(f_k)⊗⋯⊗f_n)`, with the additional factor `(-1)^(k−1)` in the antisymmetric case. Prove `a†(f₁)⋯a†(f_n)Ω=√(n!)P_n(f₁⊗⋯⊗f_n)`, including n=0. Arbitrary such vectors need not be normalized.

Retain `D(N_total^(1/2))` as a common sufficient domain with the bound above and prove it is a graph core, and retain `D(N_total)` and the finite-particle core as the stated product domains. For a nonzero bosonic direction f set `u=f/‖f‖` and `N_u=dΓ(P_u)`, where P_u projects onto ℂu. Prove that the closures of the finite-core annihilation and creation are mutual Hilbert adjoints with maximal domains `D(N_u^(1/2))` and `D((N_u+1)^(1/2))`; these domains coincide, and the restrictions to `D(N_total^(1/2))` have those same closures. For f=0 both maximal operators are zero on the whole Fock space. The fermionic CAR operators are bounded on all antisymmetric Fock space. Preserve the physical p.108 identification of the restricted creation operator on `D(N_total^(1/2))` with the full adjoint as a source-domain discrepancy: the Hilbert adjoint of the restricted annihilator is the maximal creator. When h has a mode orthogonal to a nonzero f, exhibit a square-summable vector with zero f-mode occupation and infinite total-number expectation, so the common sufficient domain can be strictly smaller than the maximal fixed-mode domain.

For Grundling6.4(2), given any orthonormal basis `(e_j)_(j∈J)`, choose an order on J and index the CAR occupation orthonormal basis by the empty word Ω and finite strictly increasing tuples `j₁<⋯<j_n`, with vector `a†(e_j₁)⋯a†(e_j_n)Ω`. Prove norm one, orthogonality and completeness; repeated indices give zero and reordering distinct indices gives the CAR sign. This includes arbitrary J, finite-dimensional and zero h; countable J is a specialization. Preserve the source's unrestricted all-word family separately. Use CStarAlgebras C2's closed-invariant-subspace and scalar-commutant theorem for the adjoint-closed CAR family. The physical p.109 arbitrary-family version lacks those hypotheses: on ℂ², `{diag(1,0),E₁₂}` has scalar commutant and a proper closed invariant line. The physical p.110 creator-only proof also has an insufficient premise: in one-mode CAR, `T=a†=E₂₁` commutes with all creators but is not scalar. Prove the corrected Fock argument using commutation with both creators and annihilators, the joint annihilator kernel `ℂΩ` and density of creation words. With the second-linear inner product its scalar is `c=⟨Ω,TΩ⟩=⟨T*Ω,Ω⟩`; preserve the recorded coefficient `⟨Ω,T*Ω⟩` as a separate conjugation discrepancy (T=iI already distinguishes them).

Keep three further source conventions beside the existing generic owners. On physical p.117 the recorded positive continuous functional definition omits norm one; compare it with V0's shared normalized state carrier, and for a general positive functional record `‖Ω_φ‖²=‖φ‖` in its GNS construction, including φ=0. For a unitary `U:H₁→H₂`, use CStar C2's well-typed intertwining relation `Uπ₁(a)=π₂(a)U`; preserve the recorded `π₁(a)=Uπ₂(a)U⁻¹` with that declared direction as a typing discrepancy. In the physical p.114 shift calculation, the adopted second-linear convention gives `Im⟨it h,h⟩=−t‖h‖²`, hence the stated Weyl conjugation theorem yields `W(it h)Φ(h)W(it h)*=Φ(h)+t‖h‖²I`. Preserve the recorded minus shift separately. This sign comparison retains the existing spectrum-ℝ argument, since for h≠0 the nonzero translations still range through ℝ.

For arbitrary one-particle arguments, the algebraic finite-particle core is invariant under every finite word. Define the n-particle sectors as the symmetric and antisymmetric subspaces `S_n(H^{⊗ n})` and `A_n(H^{⊗ n})`, with their orthogonal projections and natural permutation actions. For `h` in the underlying real one-particle space, define `Φ_F(h)=(a(h)+a†(h))/√2` on this core. Prove it is essentially self-adjoint and its closure equals the Stone generator `Φ_D8(h)` of D8's regular Weyl group `t↦π(W(th))=exp(itΦ_D8(h))`; this is the explicit Fock-normalization adapter consumed by RQFT. Transfer D8’s invariant-domain commutator `[Φ_D8(f),Φ_D8(g)]=i Im⟨f,g⟩` and vacuum characteristic function `⟨Ω,W(h)Ω⟩=exp(−‖h‖²/4)` through this Fock-field closure equality, with D8’s convention `W(f)W(g)=exp(−i Im⟨f,g⟩/2)W(f+g)`. QF4 owns the closure/domain comparison and its transferred consequences; D8 owns those Weyl/field and vacuum identities. Prove Fock irreducibility. For Bogoliubov automorphisms consume D8's stated CAR (U,V) and symplectic Weyl constructions; QF owns their Fock/domain comparisons and uses D8's CAR/Weyl separability statements; for Grundling Theorem 6.5 also prove strong continuity of W, the stated Weyl conjugation formula on its invariant domain, Γ(U)-covariance with its domain map, and the Fock norm comparison `‖W(h)−I‖=2` for every nonzero one-particle h. Consume D8's universal Weyl norm identity through the nonzero Fock representation, which is faithful by D8's simplicity theorem for the nondegenerate form `Im⟨·,·⟩`; this is a representation comparison, not a second universal-algebra proof. When the one-particle space is nonzero, apply it to h/n→0 to prove failure of operator-norm continuity, retaining the distinct strong-continuity theorem. D8 owns the separate universal Weyl-algebra nonseparability statement of Grundling Theorem 6.7(4); no nonseparability assertion about the Fock Hilbert space is inferred. Retain the separately specified nonregular representation of 6.8 Remark1 below. Preserve the recorded p114 proof equality separately: for the spectral measure μ_ψ of Φ_D8(h), prove the corrected bounded-calculus identity `2∫(1−cos λ)dμ_ψ(λ)=‖(W(h)−I)ψ‖²=4‖ψ‖²−‖(W(h)+I)ψ‖²`. The recorded last norm with W−I has the wrong sign; do not use it as a proof of the true norm-jump target or silently rewrite its source transcript. Also compare the recorded p113 continuity estimate with the proved field bound: on D(N^(1/2)), prove `‖(Φ_D8(f)−Φ_D8(g))ψ‖≤(‖f−g‖/√2)(‖N^(1/2)ψ‖+‖(N+1)^(1/2)ψ‖)≤√2‖f−g‖‖(N+1)^(1/2)ψ‖`. The displayed p113 coefficient1/√2 in front of only the last graph norm is insufficient: in one normalized bosonic mode, f−g=1 and ψ the normalized one-particle vector give left norm√(3/2) but that reported bound gives1. Preserve this recorded discrepancy. Derive strong continuity of W from its Weyl relations and vacuum characteristic function on the dense coherent-vector span, extending to every vector by the unitary norm bound; do not infer bounded-functional-calculus convergence from an unspecified operator topology. For h≠0 prove the generator spectrum `σ(Φ_D8(h))=ℝ` from its unitary translation conjugations and nonempty self-adjoint spectrum. Its spectral projections on nonempty open intervals are nonzero. A vector in each small interval around π suffices for an operator-norm lower bound; the whole Fock space need not be spanned by vectors from those shrinking intervals. Keep the p114 recorded spanning sentence separate from this corrected spectral-support argument. Keep 6.6(6)'s separability condition distinct from 6.6(8). Record the literal CCR-on-`D(N^{1/2})` source assertion and compare it with the proved domain. For the finite-dimensional Stone–von Neumann theorem, choose a symplectic basis identifying `(S,B)` with `ℝⁿ×ℝⁿ` and `B((q,p),(q′,p′))=p·q′−q·p′`; pin the regular Weyl convention by `W(q,p)ψ(x)=exp(i p·(x+q/2))ψ(x+q)`, which satisfies the stated multiplier. Prove every regular irreducible representation with this fixed multiplier is unitarily equivalent to this Schrödinger representation, and decompose every regular representation as it tensored with a multiplicity Hilbert space. For the Fock comparison identify `(q,p)` with `z=p+iq∈ℂⁿ`, with no additional scalar factor: in the second-linear inner product `Im⟨z,z′⟩=p·q′−q·p′=B`. Prove this real-linear symplectic identity and use the same multiplier in the Schrödinger/Fock intertwiner. QF4 develops
the finite/infinite sector probability laws and cutoff oscillator examples using this API. The
D8 Weyl convention is
W(f)W(g)=exp(−i Im⟨f,g⟩/2)W(f+g); consume D8's Weyl-to-field commutator proof on its invariant domain and prove the chosen Fock normalization agrees with it. The source pp.60 and 223 print the same scalar `exp(i(st′−s′t)/(4π))`, recorded literally in the source ledger. Preserve this literal source formula. The source's displayed commutation relation and Weyl prefactor have opposite signs under the stated translation convention; derive the consistent model formula and retain both literal source formulas as a source inconsistency. On p.111, with the printed field commutator and
`W=e^(iΦ̄)`, the displayed product formula has the opposite sign from the p.113 product formula
derived in its proof. Record that internal discrepancy as a source-level inconsistency. Grundling p.118 defines `B(f,g)=Im⟨f,g⟩` in the CCR setup; p.119 uses that prior definition. Keep the abstract formula and the concrete source sign discrepancy separate.

### Gaussian configuration and occupation-coordinate realization

For Grundling p.103's parenthetical `L²(L²(ℝⁿ),μ)`, preserve that μ and its measurable structure were not specified. Build the following explicit adopted model. Choose a complete separable real Hilbert configuration space H_R, an orthonormal basis `(e_i)_(i∈ι)` indexed by a finite or countable type, and strictly positive real q_i with `Σ_i q_i<∞`. Use its Borel sigma-algebra and complex outer L². On the native iid standard-Gaussian product probability space construct the measurable map
`X(ω)=Σ_i √q_i ω_i e_i`,
setting it0 on the null exceptional set where the series fails to converge. Prove a.s. convergence by `E Σ_i q_i ω_i²=Σ_i q_i<∞` and orthogonal-series completeness, and define `γ=Measure.map X ν`. Prove γ is a centered Borel Gaussian probability measure in native `ProbabilityTheory.IsGaussian`, define its covariance operator by Qh=Σ_i q_i⟨e_i,h⟩e_i and prove it is positive, self-adjoint and trace class in the existing V4.Core/OperatorIdeals carrier, with Qe_i=q_i e_i and trace(Q)=Σ_i q_i, and `∫‖x‖²dγ=Σ_i q_i`. Prove its characteristic function `∫e^(i⟨h,x⟩)dγ=exp(−Σ_i q_i⟨h,e_i⟩²/2)` by the finite sums and L² limits, with uniqueness in the native Gaussian covariance API. Include the zero/finite-dimensional cases and prove full support when every q_i>0.

Define the continuous coordinates `ξ_i(x)=⟨e_i,x⟩/√q_i`; prove they are iid standard Gaussians under γ. Prove the Borel coordinate map Ξ:H_R→ℝ^ι and the Gaussian-series map are inverse on the full-product-measure weighted-square-summable set `{ω:Σ_i q_i ω_i²<∞}` and that X∘Ξ=id on H_R. Derive the actual inverse a.e. pullback isometries on L² using native `MeasureTheory.Lp.compMeasurePreserving` and its norm/composition identities, and prove the coordinates generate the Borel sigma-algebra, with the a.e. completion dictionary stated. For this chosen Gaussian model prove the countable-coordinate bridge explicitly. On ν prove the union of the finite-coordinate L² subspaces is dense: finite cylinders generate the product sigma-algebra, their indicators lie in that union, and the class of events whose indicators lie in its closed span is a Dynkin system by finite-measure L² dominated convergence. Apply the π–λ theorem and native simple-function density. Consume [Completed/OrthogonalL2Bases A3′/B3/Part D](../../Completed/OrthogonalL2Bases/README.md), `TauCeti.gaussianHermiteHilbertBasis` and `TauCeti.gaussianHermitePiBasis` on each finite restriction; the latter has a `Fintype` premise. Using finite marginal laws, degree-zero consistency and the total-span argument, build the complete complex Hilbert basis
`h_α(x)=∏_(i∈support α) He_(α_i)(ξ_i(x))/√(α_i!)`, `α:ι→₀ℕ`,
where He is the existing probabilists' `Polynomial.hermite` evaluated on real coordinates. Prove its a.e.-representative formulas, inner products, Parseval, L² expansion and uniqueness, and the projection/conditional-expectation comparison for each finite-coordinate subspace. This bounded standard-Gaussian countable-coordinate/Hermite bridge belongs to the present model adapter; native product measures, conditional expectation and generic measure extension are not reconstructed. StochasticCalculus S6.1's normalized Brownian-grid pullback and Wiener-specific dyadic density remain that supplier's separate targets.

Let K be the complexification of H_R, equivalently a complex Hilbert space with the declared antiunitary conjugation and real fixed space H_R. On D8's shared completed symmetric Fock carrier prove the normalized bosonic occupation basis
`v_α=(∏_i α_i!)^(−1/2) ∏_i(a†(e_i))^(α_i) Ω`
is a Hilbert basis, where the product is finite, |α|=Σ_i α_i is the total occupation and the zero occupation is the vacuum. Compare it with `√(|α|!/∏_i α_i!) P_s(⊗_i e_i^(⊗α_i))`. Prove the complex-linear unitary S:F_s(K)→L²(H_R,γ;ℂ) characterized by S(v_α)=h_α, with inverse expansion and Parseval, SΩ=1 and total-number grading equal to total Hermite degree. Prove the transported number-operator domain is exactly `{f:Σ_α |α|²|⟨h_α,f⟩|²<∞}` with coefficient action multiplying by |α|. On the finite Hermite-cylinder core prove `S Φ(e_i) S⁻¹=M_(ξ_i/√2)` for QF's Segal field normalization, and identify their maximal self-adjoint closures by the existing field/core and multiplication-calculus results, with multiplication domain exactly `{f:∫|ξ_i|²|f|²dγ<∞}`. On that polynomial core derive the ladder comparisons `Sa(e_i)S⁻¹=∂_(ξ_i)` and `Sa†(e_i)S⁻¹=ξ_i−∂_(ξ_i)`, where the derivative is the finite-coordinate polynomial derivative. Compare their maximal mutual-adjoint closures with the coefficient domains `Σ_α α_i|⟨h_α,f⟩|²<∞` and `Σ_α(α_i+1)|⟨h_α,f⟩|²<∞`, respectively. Derive `SΦ(ie_i)S⁻¹=i(ξ_i−2∂_(ξ_i))/√2` on the same core; maximal field closures use the existing self-adjoint field API rather than an equality with a sufficient number domain. In the empty-index case prove γ=δ₀ and both Hilbert spaces reduce to the vacuum/constant line.

For the concrete infinite-dimensional example H_R=L²(ℝᵈ;ℝ), d≥1, choose the real Hermite-function basis and reindex it by ℕ, put q_n=4^(−n), n≥0, and obtain normalized coordinates `ξ_n(x)=2^n⟨e_n,x⟩`. Thus the construction supplies an explicit meaning for the source's proposed outer L² on an inner L² configuration space. It is a chosen real form and chosen covariance, not an unspecified Lebesgue measure on an infinite-dimensional space. Prove that covariance I cannot define an H_R-valued centered Gaussian in infinite dimension: its ONB coordinates would be independent standard Gaussians, and independent Borel–Cantelli makes `Σ_n ξ_n²=∞` a.s., contradicting Hilbert-basis square summability. Covariance I remains legitimate in finite dimension. The displayed unitary is an explicit Gaussian/occupation realization and does not identify this measure with the source's undefined μ.

## Milestone QF4 — composite systems, entanglement and statistics

Consume VonNeumannAlgebras V2's completed Hilbert tensor product `H ⊗̂ K`
and CStarAlgebras C5's minimal C*-tensor product. Use V2's elementary tensors,
inner-product and norm formulas, dense span and bounded tensor-map API to construct
tensor products of model unitary group actions, and identify
`A⊗1` and `1⊗B` as commuting bounded observables. Construct partial trace for positive
trace-class density operators and prove its defining pairing against bounded observables,
positivity, trace preservation and compatibility with product states. Define product,
separable and entangled states; prove the Bell vector is not a product vector by reduced
density matrices and compute its correlated outcomes. Include finite-dimensional Schmidt
decomposition with uniqueness qualifications for repeated/zero singular values.

For n particles define the permutation unitary action on H^⊗n, its symmetric and
antisymmetric closed subspaces, and the projections obtained by averaging over S_n. Prove orthogonality of the two sector projections for n≥2 and that each projection has exactly its named closed sector as range; for n=0,1 the two projections coincide. Prove the outcome/state identities on each sector. Do not assert their sum is identity on the full tensor power: for n≥3 and dim H≥2, other permutation types occur.
Develop the QF Fock-operator API above on the D8 Fock carriers for n-particle sectors, creation and
annihilation operators, number/second quantization, finite-particle cores, CCR/CAR domains and
bounds, and Fock irreducibility. QF proves the finite cutoff oscillator, its boundary commutator,
finite-dimensional CCR obstruction, trace obstruction and model-specific state/outcome laws.
Consume UO-E01 for the bounded commutator obstruction. Retain the p.134 source's algebraic induction. The handwritten exponent in the displayed norm estimate is unclear; the transcript records the visible `n−1` while the following conclusion uses exponent `n`. Preserve that literal uncertainty rather than silently repairing the source. The valid bounded-self-adjoint argument uses `‖Q^n‖=‖Q‖^n`, yielding `n≤2‖P‖‖Q‖` for nonzero Q and scalar commutator `c` with `|c|=1` (for general `c≠0`, the bound is `n|c|≤2‖P‖‖Q‖`) and a contradiction as n grows. The self-adjoint hypothesis makes this norm-power identity valid. For general bounded Q, QF consumes UO-E01's factorial-growth proof using actual powers and the nilpotent case.
Instantiate the full one-mode oscillator on infinite-dimensional symmetric Fock space, specifying
the finite-particle core, closures, number spectrum and spectral probability laws. For cutoff
states |0⟩,…,|N⟩, prove [a_N,a_N†]=1−(N+1)|N⟩⟨N|. The bounded Wintner–Wielandt obstruction is owned by UO-E01; QF4 uses it only to distinguish the infinite oscillator from a finite cutoff.

Spin–statistics is outside this supplier and belongs to RelativisticQuantumFieldTheory RQFT4 under its explicit field, locality, spectrum, positivity and domain hypotheses. This milestone supplies permutation sectors only; it does not state or prove
the spin–statistics theorem.

### Grundling’s universal CCR algebra and regularity boundary

For Grundling pp.118–120, use a real nondegenerate symplectic space `(S,B)` and the unital universal Weyl algebra with source convention `W₊(f)W₊(g)=exp(iB(f,g)/2)W₊(f+g)` and `W₊(0)=1`. Consume D8’s universal algebra at symplectic form `−B`; no norm continuity of `f↦W₊(f)` is assumed. D8 owns simplicity, symplectic functoriality and the nonseparability result below. A nonzero unital represented Weyl family generates an isomorphic algebra by that simplicity and universality; do not state this uniqueness for the zero representation. Distinguish the nonseparability of the algebra from separability of a regular representation’s Hilbert space.

For a complex Hilbert one-particle space `h`, with `B=Im⟨·,·⟩`, choose an antiunitary conjugation `C`. Own the sign adapter from the source algebra to D8’s Weyl multiplier `exp(−iB(f,g)/2)` sending `W₊(f)` to `W₋(Cf)`. Prove the Weyl and adjoint relations and its inverse, using `Im⟨Cf,Cg⟩=−Im⟨f,g⟩`. The transported Fock vacuum has characteristic function `exp(−‖f‖²/4)` and is cyclic; consume VNA’s GNS uniqueness theorem to construct the unitary intertwiner from its GNS representation to this Fock model. The Gaussian formula requires this Hilbert/covariance structure; it is not a state formula on an arbitrary bare symplectic space with an unspecified norm.

Own an explicit nonregular representation for p.120 Remark1. On the explicitly nonseparable Hilbert space `ℓ²(ℝ)` with basis `e_x`, define
`W(q,p)e_x=exp(ip(x+q/2))e_(x+q)`.
This is the source-sign family `W₊`: prove explicitly
`W₊(q,p)W₊(q′,p′)=exp(i(pq′−qp′)/2)W₊(q+q′,p+p′)`.
For comparison on D8's opposite-sign Weyl algebra, use
`W₋(q,p):=W₊(q,−p)`, hence `W₋(q,p)e_x=exp(−ip(x+q/2))e_(x+q)`,
and prove the negative-multiplier relation. Extend the basis permutations/phases to
unitaries and use universality for the respective algebra. Compare regularity and
inequivalence only after these sign identifications. Prove irreducibility: commuting with all modulations forces diagonal matrix coefficients, and commuting with every translation makes the diagonal constant. The coefficient `⟨e₀,W(q,0)e₀⟩` is `1` at `q=0` and `0` otherwise, so this subgroup is not strongly continuous and has no self-adjoint Stone generator. Consequently this representation is inequivalent to a regular Schrödinger/Fock representation. The `p` subgroup is strongly continuous; failure of regularity in one direction does not rule out every field generator. The separate regular infinite-dimensional family is owned later by QF6b and consumes RQFT10.

## Milestone QF5 — rays, Wigner symmetry and projective representations

Use Mathlib's Projectivization ℂ H carrier, identifying rays with nonzero vectors modulo
nonzero complex scalar. Define transition probability on rays by
|⟪x,y⟫|²/(‖x‖²‖y‖²) and prove representative independence. Prove unitary and antiunitary
maps induce transition-preserving bijections. Prove Wigner for transition-preserving bijections
(including complex dimension two) and Uhlhorn for bijections of rays in complex dimension at least three that preserve orthogonality in both directions. Pin the unitary/antiunitary alternatives and uniqueness up to
unit scalar. Handle dimension one; in dimension two give explicit orthogonality-preserving
bijections that do not preserve transition probability. The Uhlhorn hypothesis is preservation of orthogonality in both directions, not merely preservation in the forward direction. For the projection-lattice application, prove that an orthoautomorphism of `P(H)` sends atoms to atoms and induces a bijection of rays preserving orthogonality in both directions. In complex dimension at least three, apply this Uhlhorn result. In dimension two, state transition-probability preservation as the additional Wigner hypothesis and consume QF2.ElementaryBloch for the nonextendible antipodal example. QF5 owns the ray-to-projection adapter and consumes QF1’s projection and ray carriers; QF1’s logic and Hilbertization constructions are independent of this later classifier.

For Uhlhorn, write the given ray bijection as `f:P(H)≃P(H)` and require orthogonality
preservation in both directions. Fix the convention that the Hilbert inner product is linear
in its second variable, and let `R:H→H*`, `R(y)(z)=⟨y,z⟩`, be the conjugate-linear Riesz
isometry onto the continuous dual. Define the actual cross-space point map
`κ_f:P(H)→P(H*)` by `κ_f(ℂx)=(f(ℂx)⊥)⁰`. This map depends on f. Prove it is bijective
and line-preserving: the ray set of a closed linear span is its double orthogonal, so two-sided
orthogonality preservation carries the projective line spanned by two rays onto the projective
line spanned by their images. Apply QF0's cross-space point-to-point theorem to obtain a
σ-semilinear bijection `S:H→H*` inducing κ_f. Then `T=R⁻¹∘S:H→H` induces the original f
and is τ-semilinear for `τ=conj∘σ`. A correlation is not itself a collineation; neither S nor
the canonical Riesz map alone implements f.

In any complex dimension at least three, take any orthonormal pair `e_i,e_j`
and put `v_i=T(e_i)`, `v_j=T(e_j)`. Their images are orthogonal. Orthogonality
of `e_i+e_j` and `e_i−e_j` forces equal image norms. For each `z∈ℂ`, applying
`T` to `(e_i+z e_j), (−conj(z)e_i+e_j)` gives
`τ(conj z)=conj(τ z)`. Thus `τ` maps `ℝ` into `ℝ`; positivity of squares and
injectivity make its restriction order-preserving, and density of `ℚ` forces it
to fix `ℝ`. As `τ(i)=±i`, `τ` is identity or conjugation. To prove a single norm
scale, fix a unit vector `e`. For any unit vector `x`, dimension at least three
supplies a unit vector `z` orthogonal to both `e` and `x`. The pair argument
gives `‖Te‖=‖Tz‖=‖Tx‖`. Semilinearity then gives `‖Tx‖=c‖x‖` for every `x`,
with `c>0`; polarization makes `c⁻¹T` a surjective unitary or antiunitary.
This finite-span argument applies in infinite dimension as well and proves boundedness directly. As a consequence prove that `S` carries each closed hyperplane `u⊥` onto `{ℓ∈H*: ℓ(v)=0}`, where `v` represents `f(ℂu)`, and that `S,S⁻¹` are bounded. QF5 uses QF0's cross-space point-to-point theorem for this Uhlhorn construction; QF1's Banach automatic-continuity lemma is an independent Hilbertization target.
Prove uniqueness up to a unit scalar and each span and norm-scaling adapter.
**QF5.P — strong operator groups and Borel automatic continuity.**
Define U(H)_s with the strong operator topology and PU(H)=U(H)_s/𝕋 with the quotient
topology. For a complete separable complex Hilbert space choose a conjugation C,
a conjugate-linear isometric involution. Define
`UA_C(H)=U(H)_s⋊ℤ/2`, with the nontrivial element acting by `U↦CUC`,
and `PUA_C(H)=UA_C(H)/𝕋`; write UA(H), PUA(H) once C is fixed.
Explicitly `(U,e)(V,f)=(U C^e V C^e,e+f mod2)`.
The scalar circle is a compact normal subgroup, central in the even subgroup;
odd elements conjugate phases. For H≠0 prove `(U,e)↦U C^e` is a topological
group isomorphism onto the actual group of all unitary and antiunitary operators,
with its strong topology and two components. Prove the component is locally
constant by testing a nonzero x and ix. Compare two choices C,C′ by the
isomorphism `(U,e)↦(U C^e(C′)^e,e)`, so the actual group and quotient do not
depend on the choice. For H=0 retain the formal grading group ℤ/2 separately:
the two grades represent the same zero-dimensional operator, the scalar image
is trivial, and no faithful operator/ray identification is asserted. In this
case quotient by the scalar image; for H≠0 it is the embedded circle𝕋.

Prove U(H)_s is Polish. For a countable total sequence (e_n) in the unit ball use
`Σ_n 2^(−n−1)(‖(U−V)e_n‖+‖(U*−V*)e_n‖)` as a complete metric; prove it
induces the strong topology and is separable. Completeness uses both operator
and adjoint limits and their inverse identities. Prove its Borel sigma algebra
is generated by the countable coefficient maps `U↦⟨e_m,Ue_n⟩`. Use Gram–Schmidt
on the total sequence, omitting zero remainders, to obtain a finite or countable
orthonormal basis of finite linear combinations. Recover strong distance balls
from those coefficients and the norm identities, then a countable strong basis.
Thus countably strong-Borel coefficient data gives a Borel map into this actual
group. Prove UA(H) Polish and its Borel structure generated by its grade together
with countably many operator coefficients; the grade is necessary to distinguish
linear and antilinear operators agreeing on a complex basis. Prove a compact
normal quotient of a Polish group is Polish and apply it to PU and PUA with
these actual quotient topologies. Their Borel structures are the quotient
Polish Borel structures, not phase-dependent coefficient sigma algebras.
Construct Borel sections from the local sections below and a countable Borel
partition, proving `B is Borel ↔ q⁻¹(B) is Borel` for these quotient maps.
Retain the separate dimension hypotheses for faithful actions on rays.

Own Banach–Pettis in the precise form used here: a Borel homomorphism from a
Polish group to a separable metrizable topological group is continuous. Prove
the Baire-property/nonmeagre-set difference lemma and use a countable target
neighborhood cover to derive continuity at1. This includes lcsc groups with
their Borel structures. NQS M1/M2 consume this result and the preceding
unitary/graded coefficient and projective quotient Borel structures.
NQS M5.LittleDual consumes the coefficient Borel structure for its actual
representation coding and Mackey/Fell comparison. These consumers do
not introduce a second automatic-continuity theorem. These Polish claims require
separability; Wigner/Uhlhorn retain their own dimension and Hilbert hypotheses.

<a id="qf5-character-regularity"></a>
**QF5.CharacterRegularity — algebraic and Borel characters.** Develop this
unit independently of the quantum-symmetry applications: it uses rational
linear algebra, the usual topologies and Borel structures on ℝ and Circle,
and the preceding Banach–Pettis theorem. It requires no Gleason, Wigner,
Segal or JBW reconstruction input. Use native monoid homomorphisms
`Multiplicative ℝ →* Circle` for algebraic characters; continuity and Borel
measurability are additional properties of that same carrier.

Construct a ℚ-linear map A:ℝ→ℝ with `A(1)=0` and `A(√2)=π` by proving
ℚ-linear independence of 1,√2 and extending the specified map from their
span to a Hamel basis. Set `γ(x)=Circle.exp (A(x))` and prove the group law,
`γ(q)=1` for every rational q and `γ(√2)=−1`. If γ were continuous, density
of ℚ would force γ=1 everywhere; hence it is discontinuous. The preceding
Banach–Pettis theorem then proves γ is not Borel measurable. This supplies
an explicit prescribed-value counterexample; abstract group homomorphisms
are not implicitly continuous or measurable.

Conversely every Borel homomorphism `Multiplicative ℝ →* Circle` is continuous
by that same Banach–Pettis theorem. Prove it has a unique real frequency a,
`γ(x)=Circle.exp (a*x)`, and that each such formula is a Borel continuous
homomorphism. Consume native `Circle.toUnits` and
`TauCeti.existsUnique_eq_expUnitHom_complex` from
`TauCeti.Geometry.Lie.Exponential.Units.Complex`; unit modulus forces the
real part of its complex parameter to vanish. This is a specialization of
the shared automatic-continuity theorem, not a second general engine.
The construction and classification fix Conway, *A Course in Functional
Analysis*, second edition, VII.9 exercise7, and test the regularity assumptions
of the ray-symmetry interfaces below.
[CharacterRegularityTargets.lean](CharacterRegularityTargets.lean) illustrates
the prescribed-value witness and the Borel classification.

Prove U(H)_s→PU(H) has local continuous sections by fixing a nonzero test vector
and normalizing the phase of its nonzero coefficient in a neighborhood of a
chosen lift; treat H=0 separately. Obtain sections of UA(H)→PUA(H) on the even
component from these and on the odd component by right multiplication by C:
`s_odd([UC])=s([U])C`. Thus every continuous homomorphism into PU or PUA has
local continuous lifts of its actual grade. For the previously defined PUA(H),
prove its action on rays and identify the transition-probability topology when
`dim H≥2`. In dimension one the ray space is a singleton and the action is not
faithful; handle it separately. For connected G prove a continuous ray
representation lies in the unitary component; in general its unitary subgroup
has index at most two. Construct the pullback graded circle extension and
local lifts for every continuous ray action, and prove the overlap cocycle.
Its circle is central over the even subgroup, while odd lifts conjugate phases;
in the unitary-only case this is an ordinary central extension. When a global
continuous unitary lift is given, define its normalized continuous multiplier
and prove the cocycle and phase-change/coboundary laws. The suggested `GlobalContinuousProjectiveUnitaryLift` records exactly this stronger global-lift datum. Its operator at1 is identity, and its rephasing by a continuous unit-circle function b with b(1)=1 has multiplier `b(g)b(h)b(gh)⁻¹ω(g,h)`. Prove the identity, rephasing, inverse and composition laws. The compatibility alias `StronglyContinuousProjectiveRepresentation` for these same data carries this global-section hypothesis; it is not the carrier for all continuous ray representations.

Pin the multiplier examples precisely. Dooley p.12 writes a homomorphism from ℝ₊ into G
but then a projective representation on ℝ; preserve those separate source domains and prove that every continuous monoid homomorphism `f:([0,∞),+)→G` into a
topological group extends uniquely to a continuous group homomorphism on `ℝ`:
for `t=a−b` with `a,b≥0`, put `F(t)=f(a)f(b)⁻¹`. Prove independence of the
decomposition using commutation of the image, the group law, uniqueness, and
continuity by writing locally `F(t)=f(t+b)f(b)⁻¹` with fixed `b` and `t+b>0`. Normalized continuous
multipliers of ℝ are continuous
coboundaries. First obtain a global continuous lift of any continuous ray action
of ℝ by trivializing its pullback circle bundle over the contractible base;
then this coboundary theorem gives a genuine continuous unitary representation
and Stone's theorem applies. For ℝⁿ, n≥2, give the alternating-bilinear-form
classification and a nontrivial Weyl example. Distinguish globally continuous
multipliers from locally continuous extension cocycles. For the latter use normalized
Borel cocycles f continuous near (1,1) and require, for each g, continuity near 1
of `h↦f(g,h)/f(ghg⁻¹,g)`. Prove the latter conjugation condition is automatic
for connected G and holds for cocycles from locally sectioned topological
extensions. Quotient by normalized Borel coboundaries continuous near 1; prove
that gluing local product charts classifies topological circle central extensions
with local continuous sections. State this convention as H²_lc.
For finite-dimensional Lie G own local-exponent smoothing: take a real logarithm
near (1,1), use local Haar averaging and the cocycle equation to produce a
cohomologous locally smooth exponent, and prove independence of charts/averaging.
Construct the compatible smooth extension atlas, its smooth operations and Lie
algebra extension; prove equivalence of locally continuous and locally smooth
extension classes. Cover disconnected G as well: construct the smooth atlas on
the identity component first, then transport it by translations to every
component. Prove conjugation there is smooth using the automatic smoothness
of continuous homomorphisms between finite-dimensional Lie groups from
LieGroups Layer2 (Cartan automatic smoothness); Layers4–5 supply integration and simply connected covers separately. Verify the mixed-component multiplication/inverse charts and
chart independence. The local conjugation continuity condition above is
retained in this construction.
This supplies the Lie-group structure needed before using
Lie-algebra splitting; automatic smoothness of already given Lie homomorphisms
alone is insufficient.
For a second-countable locally compact group `G` and a locally sectioned circle extension `E→G`, construct a global Borel section from its local continuous sections: choose a countable cover `(U_n)` on which sections `s_n` are continuous, replace it by the disjoint Borel partition `A_1=U_1`, `A_n=U_n\(U_1∪…∪U_{n−1})`, and set `s(g)=s_n(g)` on `A_n`. This is Borel, and the section agrees with a continuous local section on a neighborhood of the identity after choosing one chart containing `1`; normalize by a fixed circle factor so `s(1)=1`. State second countability and local triviality explicitly. This is the Borel lift used for the multiplier convention, not a global continuous section.

For normalized unitary/antiunitary lifts, let `ε(g)=0` for linear unitary `U_g` and `ε(g)=1` for antiunitary `U_g`, and write `U_gU_h=ω(g,h)U_{gh}` with `ω(g,h)∈𝕋`. Associativity gives the exact twisted cocycle law
`ω(g,h)ω(gh,k)=ω(h,k)^{(-1)^{ε(g)}}ω(g,hk)`, where exponent `−1` means complex conjugation on `𝕋`. Under a phase change `U'_g=b(g)U_g`, prove
`ω'(g,h)=b(g)b(h)^{(-1)^{ε(g)}}b(gh)^{-1}ω(g,h)`.
Dooley p.11 instead writes `U_{gh}=c(g,h)U_gU_h`, so its scalar is
`c(g,h)=ω(g,h)⁻¹` with these same ordered lifts. These formulas include the antiunitary action on scalars; the ordinary untwisted cocycle law applies only when `ε=0`.

Also own the finite-dimensional semisimple Whitehead inputs used here, by
NQS and by RQFT6’s connected-Lorentz finite-jet covariance adapter: every linear 1-cocycle into a finite-dimensional module is a coboundary,
and every alternating 2-cocycle with trivial scalar coefficients is a coboundary.
For degree 1 use LieHighestWeight Layer 5's native `TauCeti.exists_isCompl_of_isKilling` over the stated characteristic-zero field and actual finite-dimensional `IsKilling` Lie algebra, on the extension
module V⊕𝕜; for degree 2 identify the cocycle with a skew derivation by the
nondegenerate Killing form and apply degree 1 to the adjoint module. State the
actual cochain equations and compare with the point Chevalley–Eilenberg calculus
of LieGroupoidsPoisson G1.3; no second cohomology carrier is introduced.
Prove `H²_lc(SO(3),𝕋)≅ℤ/2` by Lie-algebra splitting and the two characters of
π₁(SO(3)); consume LieGroups' finite-dimensional integration and AlgebraicTopology's
cover/fundamental-group comparisons. Realize the nontrivial circle extension as
`(SU(2)×𝕋)/⟨(−I,−1)⟩≅U(2)→SO(3)`, with kernel 𝕋, the pushout of the SU(2)
double cover. Prove its local sections and lack of a global continuous section,
for example by the induced fundamental-group sequence. Thus its spin-half ray action
has local continuous lifts and a Borel multiplier but no globally continuous unitary
lift; the nontrivial extension class has no globally continuous cocycle representative.
Prove the natural comparison from globally continuous cohomology to H²_lc and characterize
its image by existence of a global continuous section. Consume CompactGroups for compact representations and
RepresentationTheory/LieHighestWeight for SU(2) highest weights and Clebsch–Gordan decomposition.
**Dooley SU(3) matrices and the adopted weight convention.** In display indices
`1,2,3`, reindexed to native `Fin 3`, adopt the following specific trace-zero
skew-Hermitian matrices:

```
Q  = i·diag(1/3,−2/3,1/3),
I₁ = (i/2)·[[0,1,0],[1,0,0],[0,0,0]],
I₂ = (1/2)·[[0,1,0],[−1,0,0],[0,0,0]],
I₃ = (i/2)·diag(1,−1,0).
```

Prove their membership in the real matrix Lie algebra and transport them through
the actual Lie-carrier equivalence below before applying a derived representation.
For `H₁=i(E₁₁−E₂₂)`, `H₂=i(E₂₂−E₃₃)`, prove
`Q=(H₁−H₂)/3`, `I₃=H₁/2`,
`I₁=i(E₁₂+E₂₁)/2` and `I₂=(E₁₂−E₂₁)/2`.
The cyclic commutators are `[I₁,I₂]=−I₃`, `[I₂,I₃]=−I₁`,
`[I₃,I₁]=−I₂`; `[Q,I₃]=0`. These signs are part of the chosen convention.

For every finite-dimensional continuous unitary SU(3) representation π, consume
[LieGroups Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0942b6c99c9c9baff3c962bc672bcaab81baff48/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
for automatic smoothness and
[Layer 3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0942b6c99c9c9baff3c962bc672bcaab81baff48/TauCetiRoadmap/RepresentationTheory/LieGroups/README.md#layer-3-the-lie-functor-and-baker-campbell-hausdorff)
for the Lie functor and exponential naturality, and consume the CompactGroups/circle
and LieHighestWeight suppliers for the diagonal-torus character decomposition,
integer-character comparison and weight multiplicities. Choose an
orthonormal weight basis v_j and integers k_j,l_j so that, for real s,t,

```
H(s,t)=i·diag(s,t,−s−t),
dπ(H(s,t))v_j=i(k_j s+l_j t)v_j.
```

Here the weights are functionals on this Cartan subalgebra (and its
complexification), not simultaneous eigenvalue functionals on all of su(3).
Define `w_j(H(s,t))=i(k_j s+l_j t)` and the dimensionless Hermitian observable
`A_X=(1/i)dπ(X)`. Thus `π(exp(tX))=exp(itA_X)` in the chosen positive Stone
convention. Prove the explicit charge and corrected third-isospin dictionary

```
A_Q v_j = ((k_j−2l_j)/3)v_j,
A_(I₃) v_j = ((k_j−l_j)/2)v_j,
w_j(Q)/i=(k_j−2l_j)/3,
w_j(I₃)=i(k_j−l_j)/2,    w_j(I₃)/i=(k_j−l_j)/2.
```

For the defining representation the three torus weights are `(1,0)`, `(0,1)`,
`(−1,−1)`, giving charge eigenvalues `1/3,−2/3,1/3` and third-isospin
`1/2,−1/2,0`. Include repeated weights in every representation's multiplicity;
I₁ and I₂ are the displayed non-Cartan operators, not extra diagonal weights.
For any chosen ℏ>0 put `J_a=ℏA_(I_a)` and prove
`[J_a,J_b]=iℏ ε_abc J_c`; an electric-charge unit e₀>0 multiplies A_Q by e₀.
Compare any inverse-group/negative-exponential physical convention through the
existing generator-sign dictionary. These eigenvalues label the internal
multiplet components; dimension alone does not assert an independent
many-particle Fock system.

The matrices and the `1/i` observable normalization above are adopted mathematical
conventions. Preserve separately Dooley p.28's literal `w_j(Q)/i` reading, its
faint charge-coefficient qualification, and its raw `w_j(I₃)` expression; the
adoption does not verify an uncertain glyph or make raw w_j(I₃) real. The source's
wording about linear forms on the Lie algebra is compared with the precise
Cartan-weight statement just given. Retain the type-I/projective exterior-product
hypotheses in the G×SU(3) application and the full SU(6) broken-symmetry target below.

**SU(3) real dimension in the actual Lie carrier.** Consume
[LieGroups Layer 2](../RepresentationTheory/LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
to identify `Lie(Matrix.specialUnitaryGroup (Fin 3) ℂ)` over ℝ with
the trace-zero skew-Hermitian matrices, preserving the commutator bracket.
Prove `finrank ℝ Lie(SU(3))=8` through this equivalence. With display indices
`1,2,3` explicitly reindexed to native `Fin 3`, give the real basis
`i(E₁₁−E₂₂), i(E₂₂−E₃₃)` and, for each `j<k`,
`Eⱼₖ−Eₖⱼ, i(Eⱼₖ+Eₖⱼ)`. Check membership, independence and spanning:
the diagonal entries are imaginary with one real trace relation, leaving two
real parameters; the three upper-triangular complex entries determine the
lower entries by skew-adjointness and supply six more real parameters.
Transport this calculation back to the actual left-invariant-derivation Lie
carrier; an eight-dimensional matrix subspace by itself does not identify
that carrier. Express the adopted matrices Q and I₁,I₂,I₃ in this basis in the charge/isospin
weight example, retaining the source's literal and corrected scalar conventions.

Develop finite-dimensional symmetry-breaking Hamiltonian models with an explicit parameter and error bound. Given a unitary `SU(6)` action, self-adjoint invariant `H₀`, and self-adjoint `V` commuting with the chosen embedded `SU(3)`, set `H_λ=H₀+λV`. Prove exact residual `SU(3)` covariance and the Duhamel bound `‖exp(−itH_λ)−exp(−itH₀)‖≤|tλ|‖V‖`, together with `‖[H_λ,U(g)]‖≤2|λ|‖V‖`. Work the defining six-dimensional example `ℂ⁶=ℂ³⊗ℂ²`, embedded `g↦g⊗1`, `H₀=E₀·1`, and `V=1⊗diag(1,−1)`; compute the two triplet energies and identify the full stabilizer rather than claiming it is exactly the displayed `SU(3)` subgroup. Use this parameterized model to state precisely which source symmetry assertions are exact and which are bounded approximations. Preserve Dooley p.28’s source expressions `w_j(Q)/i` and raw `w_j(I₃)`, including the Luna reader’s uncertainty about the handwritten charge coefficient. Under the chosen skew-Hermitian convention prove that raw `w_j(I₃)` is imaginary, and distinguish the corrected real isospin observable `w_j(I₃)/i` from that literal source expression. Prove the charge and corrected-isospin real-observable normalizations. Preserve Dooley p.27's parenthetical description of `SU(3)` as ‘all 3×3 unitary matrices’ (confirmed by the pagewise reread) as a source error: `SU(3)` is the determinant-one subgroup of `U(3)`, while all unitary matrices form `U(3)`. State the source's intended `SU(3)` representation using determinant-one matrices and do not use the false parenthetical as its definition. Give the cover, generator normalization and weight conventions for every finite-dimensional spin example.

### QF5.G — general von Neumann logic symmetries

This is a terminal submilestone, not a prerequisite of QF5's earlier
Hilbert-space ray, projective-group or automatic-continuity results.
Consume QF1.G/QF3.G.Model and V12.J's precise reconstruction theorems.

**QF5.G.Presentation — two full presentations.** For one separated abstract operational system,
let `(α_i,β_i,E_i)` be full VNA presentations on nonzero M_i: α_i maps its
logic onto P(M_i), β_i its states affinely onto S_n(M_i), and E_i its
observables onto the real PVM carrier, preserving every evaluation and
Borel pushforward. Prove there is a unique normal unital Jordan
*-isomorphism `Φ:M₁→M₂` satisfying

```
α₂=Φ∘α₁,  β₂(s)=β₁(s)∘Φ⁻¹,  E₂(A)(B)=Φ(E₁(A)(B)).
```

Apply V12.J.Enriched to `β₂∘β₁⁻¹` and `α₂∘α₁⁻¹`; the evaluation identity
comes from the common abstract probabilities, and normal-state separation
proves the PVM formula. Include every typeI₂ summand. Conversely transport
a full presentation along any normal Jordan *-isomorphism, preserving all
projection/PVM/state/evaluation data. Prove identity, inverse and
composition, hence uniqueness of the comparison of any two presentations.
An associative *-comparison additionally preserves a chosen orientation;
the same algebraic type need not imply Jordan isomorphism.

**QF5.G.FullActions — full-model operational actions, including typeI₂.** For every nonzero
complex W*-algebra M, identify the operational automorphism group of
QF3.G.Model, with its full normal-state and PVM families, with the normal
Jordan *-automorphism group. QF1.G forces the state pullback; it is affine,
and preservation of the full state family gives a bijection on S_n(M).
The enriched evaluation theorem therefore reconstructs every operational
automorphism, even on I₂. Prove that every abstract group action lifts
uniquely to a homomorphism into this Jordan group, with
`g·ω=ω∘Φ_(g⁻¹)` and `E↦Φ_g∘E`, and all composition/probability laws.

**QF5.G.BareLogic.** A bare projection-logic automorphism requires no state preservation. If M
has no typeI₂ central summand, V12.J.Dye identifies the whole such group
with the Jordan group. This inclusion is proper whenever a nonzero I₂
central part is present: write that part as M₂(Z), Z an abelian W*-algebra,
and apply the QF2.ElementaryBloch sphere map pointwise to its rank-one
projection fields, fixing their central rank0/2 parts. Prove order and
orthocomplement preservation by the center-valued rank decomposition,
and use constant Bloch projections to exclude a Jordan extension. Extend
by the identity on the complementary central part.
Consume QF2.ElementaryBloch's single nonextendible antipodal sphere map:
it is a logic automorphism but not an operational symmetry of the full
normal-state model, since pullback yields a non-Born frame function.
For selected proper state/observable families use QF1.G's actual stabilizer
condition; do not infer reconstruction from a proper family without the
enriched theorem's hypotheses. No pure-normal-state parametrization is
used for diffuse factors.

A Jordan automorphism of a nonabelian factor is multiplicative or complex-
linear antimultiplicative. Prove the orientation homomorphism to C₂ for a
group action; on an abelian factor choose the multiplicative convention.
For nonfactors retain the transported center and the central splitting,
which is not unique on the abelian part. Work `(x,y)↦(x,yᵀ)` on M₃⊕M₃:
it is Jordan and globally neither multiplicative nor antimultiplicative.
Work the scalar swap on ℂ⊕ℂ acting on ℂ⊕ℂ²; actual central projections
have ranks1 and2, so neither a unitary nor antiunitary on that carrier
implements it. Canonical L² implementation is a distinct theorem.

**QF5.G.StandardForm — implementation and continuity.** Consume
V12.J.CentralSplitting and V11 for the
standard form `(L²(M),M,J,P)` and its normal *-isomorphism implementers.
Prove that (L²(M),M′,J,P) is also a standard form for M′, including its
natural-cone positivity axiom under the J-conjugation dictionary. For a
normal *-anti-isomorphism θ:M→N, define the actual *-isomorphism
`M'→N`, `x'↦θ(Jx'^*J)`. Its canonical cone-preserving unitary W gives
`A=WJ`, an antiunitary with `θ(x)=A x* A⁻¹`; verify complex linearity,
antimultiplicativity, the commutant dictionary and cone preservation.
Together with the multiplicative case this gives unique cone-preserving
unitary/antiunitary implementers on nonabelian factors, with the indicated
grade. Uniqueness gives the genuine graded group law and no circle
multiplier. Implementation on a previously chosen representation requires
its separate equivalence/invariance hypothesis.

On general M choose the multiplicative convention on its maximal abelian
central part and let e_g be the input central anti-part elsewhere. Prove
`e_(gh)=e_h △ Φ_h⁻¹(e_g)`. The canonical cone map has a complex-linear
unitary extension W_g commuting with J; let
`V_g=W_g((1−e_g)+e_g J)`. It is an orthogonal real-linear isometry, linear
and conjugate-linear on the specified central pieces, and satisfies
`V_(gh)=V_g V_h`. Do not call a mixed V_g one global unitary or antiunitary.
Its corresponding algebra formula uses x on the multiplicative part and
x* on the anti-part. Prove these claims by the central standard-form
splitting and uniqueness on the natural cone, not an arbitrary scalar
choice of implementers.

For a topological group require `g↦ω∘Φ_(g⁻¹)` norm continuous for every
normal functional ω. Derive pointwise ultraweak and, on bounded elements,
strong-star continuity using the square identity and normal functional
pairings. Natural-cone bounds give strong continuity of W_g. For factors,
the nonabelian orientation is then locally constant: an anti-net tending
to the identity would force ab=ba by strong-star multiplication. For
nonfactors prove e_g→0 strongly at the identity on the nonabelian part:
put q_g=Φ_g(e_g). The anti/multiplicative formulas force
q_g Φ_g([a,b])→0, hence q_g[a,b]→0 for every a,b. The commutator-generated
ideal has full central support there, so its finite generated ranges prove
q_g→0 strongly. The predual norm bound
`|ω(q_g)−ω(e_g)|≤||ω∘Φ_g−ω||` then gives e_g→0 strongly as well.
On the abelian part e_g=0. Thus V_g is strongly continuous as a real-linear
representation. No discrete global grade is imposed on a nonfactor.

For M=B(H), compare with QF5's Wigner implementation: a unitary U gives
x↦UxU⁻¹; an antiunitary A gives the complex-linear Jordan map
`Φ(x)=A x* A⁻¹`. The earlier conjugate-linear multiplicative convention is
`α(x)=A x A⁻¹=Φ(x*)`. For a state,
`ω∘Φ⁻¹=conj∘ω∘α⁻¹`; verify equality on all x, not only projections.
QF5.P owns the Hilbert U/PU/UA/PUA topology; it does not define the general
nonfactor logic group. QF3.G.StateGeometry owns representability, including
its projection/PVM/evaluation conditions; no arbitrary-factor or general
orthoposet isomorphism classification follows from this reconstruction.

## Milestone QF6a — the free-particle core

Develop the nonrelativistic particle model on `L²(ℝⁿ)` using QF3's position and momentum
operators (no second operator definition), with the explicit Lebesgue/Fourier normalization and
their `L²(ℝⁿ)` self-adjoint domains,
translation and rotation unitary actions, and free Hamiltonian `H₀=−Δ/(2m)`, m>0, with ℏ=1. Pin its self-adjoint domain as the Fourier multiplier domain `{f∈L² : |p|² f̂(p)∈L²}` (equivalently H²), with the Fourier-variable scaling dictated by the declared normalization. On the Schwartz core prove this formula and the evolution equation `i∂_tψ=H₀ψ`. Prove the Fourier intertwining
and spectral probability formula on the Schwartz core, then extend by the proved closed-operator
and unitary-conjugacy results. For invertible real linear `T`, include the exact coordinate-change unitary `(U_T f)(y)=|det T|^(−1/2)f(T⁻¹y)` and derive how momentum, kinetic energy and potentials transform, including their transported self-adjoint domains and common cores. For a smooth diffeomorphism `T:Ω→Ω′` of open subsets of `ℝⁿ`, prove the change-of-variables unitary `(U_T f)(y)=|det D(T⁻¹)(y)|^(1/2)f(T⁻¹(y))` and transport the differential expressions on compactly supported smooth cores. Prove Schwartz invariance for linear `T`; for general `T`, state and prove sufficient polynomial growth bounds for all derivatives of `T,T⁻¹` and the Jacobian factors before claiming Schwartz preservation. Identify transported Sobolev/operator domains by unitary conjugacy rather than asserting arbitrary diffeomorphisms preserve the original domains. QF6a is a standalone input to NQS M3: it re-exports QF3’s position/momentum operators with Fourier transform, common Schwartz core, translations and sign conventions without importing NQS. QF6a also owns the restricted rotation-invariant symbol theorem: for `n≥2`, a translation-invariant scalar differential operator on `ℝⁿ` with constant coefficients, order at most two and real rotation-invariant symbol has symbol `a|ξ|²+b`. Prove the orthogonal-group-invariant version in every positive dimension and note `SO(1)` alone does not exclude a linear term. Record ellipticity/sign assumptions separately. The general measurable classification is QF6a.RadialHamiltonians below; `(−Δ)²` distinguishes it from this second-order corollary.

**QF6a.FlowPullbacks — smooth one-parameter coordinate transformations.**
For n≥1 and an open Ω⊆ℝⁿ, let `T:ℝ×Ω→Ω` be jointly smooth with
`T_0=id` and `T_(s+t)=T_s∘T_t`. Thus every T_t is a diffeomorphism with
inverse T_(−t). On L²(Ω,dx) construct
`V_t u(x)=|det D_xT_t|^(1/2)u(T_t x)` and prove it is a strongly
continuous unitary group. For a compact K⊆Ω and bounded compact time
interval I, use the compact image `{T_(−t)x:t∈I,x∈K}` to control the
supports of V_t u for u supported in K. Joint smoothness gives uniform
Jacobian and derivative bounds there. Prove continuity and L² difference
quotients first on C_c∞(Ω), then strong continuity on all L² by density
and the unitary norm bounds. This supplies an explicit adopted hypothesis
for Grundling p.224's unspecified continuity requirement.

Put `X(x)=∂_tT_t(x)|_(t=0)` and `div X=Σ_j∂_jX_j`. Prove the
Jacobian derivative and the core formula
`dV_tu/dt|_0=B_Xu=X·∇u+(div X)u/2`.
For the positive Stone convention `V_t=exp(itA_X)`, prove
`A_X|_(C_c∞)=−iB_X`. Integration by parts makes this restriction
symmetric. Smooth pullback preserves C_c∞; consume UO-E01's invariant
unitary-group core theorem to prove essential self-adjointness and identify
its closure with the actual Stone generator. Give its full domain as
`D(A_X)={u∈L²(Ω):B_Xu, interpreted distributionally, belongs to L²(Ω)}`,
with action −iB_Xu. Identify the adjoint of the compact-support restriction
with this distributional maximal operator before using essential
self-adjointness; consume PDE's distribution/weak-derivative calculus.
The global action supplies completeness; no statement about an arbitrary
incomplete vector field is implied. For p.225's x-axis rotations recover
`X=(0,−z,y)`, `div X=0` and `A_X=−i(y∂_z−z∂_y)` on the stated core
and maximal domain. Compare QF6a's inverse-coordinate unitaries by
`U_(T_t)=V_(−t)=exp(−itA_X)`.

**QF6a.RadialHamiltonians — the full scalar Euclidean-invariance theorem.**
For n≥2 work on H=L²(ℝⁿ,ℂ) with Euclidean volume, translations
`T_a f(x)=f(x−a)` and rotations `U_R f(x)=f(R⁻¹x)`, R∈SO(n).
Let A be a densely defined self-adjoint operator. Require commutation as
closed operators: each T_a and U_R maps D(A) onto itself and intertwines A
there. Prove the equivalent formulation that all spectral projections of A
commute with these unitaries. Commutation merely on a chosen test subspace
is not this hypothesis.

Put L=−Δ with its existing maximal self-adjoint realization and let
`λ(ξ)=4π²|ξ|²`, using the declared Fourier kernel. Prove that these A are
exactly `g(L)` for real Borel functions g on [0,∞). Equality includes the
maximal domain

`D(A)={f∈H : g(λ(ξ)) f̂(ξ)∈L²(dξ)}`,
`(Af)^∧(ξ)=g(λ(ξ)) f̂(ξ)`.

Use real-valued representatives, finite everywhere after null-set modification.
Set ν=λ_*dξ. Prove ν has no atom at0 and is equivalent to Lebesgue measure
on (0,∞); two such g define the same operator exactly when equal ν-almost
everywhere. In dimension1 the same classification uses O(1), while SO(1)
alone leaves arbitrary real Fourier symbols; the momentum operator is an
explicit non-even example.

Supply the Euclidean multiplier comparison in this owner. Fourier transform
turns translations into scalar character multipliers. Prove that their linear
span is weak-star dense in L∞ using BanachSpaceTheory B5's σ-finite
L¹/L∞ duality and L¹ Fourier uniqueness. Derive the complex L¹ uniqueness
adapter from native `MeasureTheory.Measure.ext_of_charFun`: separate real
and imaginary densities using the transforms at ξ and−ξ, split them into
positive/negative finite measures, and compare their characteristic functions
with the declared 2π scaling. Consume V2's σ-finite multiplication/MASA
theorem to identify the bounded commutant.
Apply this to (A−i)⁻¹ and reconstruct the real measurable multiplier and its
maximal domain from the resolvent identities, injectivity and dense range.
For rotations, construct a jointly measurable representative of this bounded
resolvent symbol, average it over normalized Haar measure on SO(n), and use
Fubini and polar coordinates to descend to the squared-radius variable.
This must justify a radial representative from separate almost-everywhere
invariance for each R; a common conull set for all rotations is not an input.
The dimension1 O(1) version uses its two-element Haar average. Prove the
converse, choice independence and all domain/unitary-conjugacy comparisons.
The generic resolvent, spectral calculus and MASA proofs remain with
SelfAdjointSpectralTheory and V2.

For arbitrary real Borel g, prove density and the graph-core property of
spectral truncations whose Fourier supports satisfy `|ξ|≤k` and
`|g(λ(ξ))|≤k`, k∈ℕ. A Schwartz-core assertion requires additional symbol
bounds. Identify boundedness and semiboundedness with the corresponding
ν-essential bounds of g, and identify the spectral projections by
`P_A(B)=F⁻¹ M_(1_{g∘λ∈B}) F`. This proves the source's measurable
`H=g(∇²)` conclusion after the sign change g(s)↦g(−s). Its affine
conclusion retains the separate constant-coefficient, order-at-most-two
premise above. The constant-energy case is g≡E. Suggested native radial
symbol and maximal-domain interfaces are in
[`RadialHamiltonianTargets.lean`](RadialHamiltonianTargets.lean).

For Grundling p.59 specialize the one-dimensional free model to m=1/2, so `H=P²=−∂²`. Preserve its recorded raw-position domain condition separately: the actual maximal domain is `{ψ:4π²ξ²(Fψ)(ξ)∈L²}=H²(ℝ)`; `1_[-1,1]` satisfies `x²ψ∈L²` but is not in this domain. Relative to P's spectral measure the domain uses a fourth moment; relative to H's spectral measure it uses a second moment, and `P_H(B)=P_P({p:p²∈B})`. Supply the source's free-propagator kernel comparison: for t≠0 and Schwartz ψ,
`(e^(−itH)ψ)(x)=(4π|t|)^(−1/2)e^(−iπ sgn(t)/4)∫_ℝ exp(i(x−y)²/(4t))ψ(y)dy`.
Derive this from the declared Fourier multiplier by inserting positive Gaussian damping, evaluating the complex Gaussian and taking the damping to zero in L² and on Schwartz vectors. Extend by the unitary L² limit; do not claim absolute kernel convergence for every L² input. Recover the general mass m>0 kernel by the time rescaling t↦t/(2m). Keep the faint recorded evolution-derivative symbols qualified instead of inferring an unseen sign.

For Grundling p.160, specialize this same m=1/2 model and prove `σ(H)=σ_c(H)=[0,∞)`, `σ_p(H)=σ_r(H)=∅`: use the Fourier multiplier4π²ξ², null level sets and normalized shrinking frequency-window approximate eigenvectors; outside[0,∞) the reciprocal symbol is the actual bounded resolvent with range in H². Keep the source's reused P/J measure notation qualified. The energy PVM uses the second moment for D(H); the momentum PVM uses the fourth moment for D(P²), as already specified for p.59. The displayed negative evolution `U(t)=e^(−itH)` has derivative−iH on D(H); the source's+iH equation belongs to the opposite generator sign. For each initial ψ₀∈D(H), identify the unitary orbit with the native `TauCeti.Semigroups.IsClassicalSolution` for the real generator underlying−iH and prove uniqueness among H-valued C¹ curves in D(H) satisfying ψ′=−iHψ. Consume `StronglyContinuousSemigroup.isClassicalSolution_realOperator`, `IsClassicalSolution.eq_realOperator` and `.unique` from the individual CauchyProblem Basic/Uniqueness modules; apply the inverse group for negative time. For arbitrary initial L² vectors consume the same modules' `IsMildSolution`, `StronglyContinuousSemigroup.isMildSolution_realOperator` and `IsMildSolution.unique`, retaining the definition's time-integral membership in the generator domain. These are model/generator adapters to the implemented abstract Cauchy problem, not new uniqueness theory. Retain the source's “no guarantee of uniqueness” beside this explicit solution class, without claiming uniqueness for an unspecified weaker class. Compare its kernel with the already fixed p.59 formula. The recorded e^(+itH) label would have the conjugate phase under this convention; preserve its small-label/normalization uncertainty and do not infer an absolutely convergent kernel integral for arbitrary L² input.

### Continuous position representatives and local averages

For `N≥1`, consume Mathlib’s `AEEqFun`/`Lp` quotient and full-support Euclidean volume. Prove uniqueness of a continuous representative of an `L²(ℝ^N,volume)` class. More generally, if two representatives agree almost everywhere near `x₀`, are both continuous at `x₀`, and every open neighborhood of `x₀` has positive measure, prove their values there agree. A point value is defined on this specified domain of classes admitting such representatives, not on all of `L²`.

For `R>0`, let `B_R=B(x₀,R)` and use native ball-volume positivity, finiteness and `R^N` scaling. Prove for the continuous-at-`x₀` representative `f` that `(vol B_R)⁻¹∫_{B_R}f(x)dx→f(x₀)` as `R↓0`, with the finite positive volume interpreted in the scalar field. Bound the difference from `f(x₀)` by the supremum of `‖f(x)−f(x₀)‖` on the shrinking ball. Separately prove `∫_{B_R}u→0` for every `L²` representative using Cauchy–Schwarz and `vol B_R→0`; this unnormalized limit does not encode the value `u(x₀)=0`. A compactly supported continuous function equal to one near `x₀` is the explicit counterexample to that interpretation. Preserve Grundling p.68’s literal assertion beside this normalized correction.

## Milestone QF6b — applications and composite model interfaces

QF6b consumes QF6a and the generic QF4 Fock API. For selected NQS representations it constructs compatible observable representations, transports the supplied covariant PVM to outcome probabilities, identifies translation/rotation/boost generators on the supplied common domains, and proves that induced-model intertwiners preserve outcome laws. It uses M3's Galilei conventions, M4's Lorentz signature/cover/central-character/Casimir/antiunitary conventions, and M5's explicitly named contraction conventions. In the G₅ model use NQS M5's `η=diag(1,1,1,−1)` and map its spatial-first indices to M4's zero-based coordinates (space indices 0–2 and time index 3) explicitly. With source spatial coordinates 1–3 and time coordinate 4 mapped to M4's coordinates 0–2 and 3, the two four-dimensional forms satisfy `η_G₅=−η_M4`; a coordinate permutation alone does not effect this sign change. Translate inverse-metric/index-raising and quadratic-Casimir signs using this global negation. M5's separate five-dimensional de Sitter coordinate permutation is a different comparison. NQS M3 consumes QF5 and QF6a; there is no QF6b→M0–M6 edge. For Grundling p.120 Remark 2, let `S` be a separable infinite-dimensional complex Hilbert space with its standard symplectic form on the underlying real space and a conjugation `C`. Define `S_t x=cosh(t)x+sinh(t)Cx`, `t∈ℝ`; prove it is bounded and symplectic with antilinear part `sinh(t)C`. For `t≠s`, the relative map `S_{t-s}` has non-Hilbert–Schmidt antilinear part. Precompose the regular irreducible Fock representation of the Weyl algebra with the corresponding Weyl automorphisms; prove regularity and irreducibility persist and apply RQFT10's Shale criterion to prove pairwise inequivalence. This realizes the source's “many inequivalent representations” claim for this explicit standard infinite-dimensional CCR algebra and regularity class, not for every infinite-dimensional CCR algebra without additional hypotheses.

**QF6b.SpinHamiltonians — the nonzero-spin Euclidean model.** Consume
NQS M3's localized model and radius/little-circle decomposition, QF6a's
Fourier and scalar multiplier comparisons, and CompactGroups/LieHighestWeight's
finite-dimensional SU(2) weight theory. Fix one irreducible spin-j space V_j,
2j∈ℕ₀, with ℏ=1; there is no extra multiplicity factor. On
H_j=L²(ℝ³;V_j) use translations and
`(U_s f)(x)=D_j(s)f(R_s⁻¹x)`, where R_s is the rotation covered by s∈SU(2).
Normalize the physical spin matrices by
`D_j(s_z(θ))=exp(−iθS_z)` and its cyclic companions. Then the physical
rotation generator is `L_z+S_z`, while the positive Stone generator of this
one-parameter U is its negative. Identify S_z's single operator and its
2j+1 distinct eigenvalues m=−j,−j+1,…,j; these eigenvalues are not 2j+1
different spin representations.

For each unit n∈S² construct the spectral projections P_m(n) of n·S.
Prove rank1, orthogonality, sum1, continuity on S² and
`P_m(R_s n)=D_j(s)P_m(n)D_j(s)*`. Give the polynomial formula
`P_m(n)=∏_{m′≠m}(n·S−m′I)/(m−m′)` and its independence of any chosen
rotation taking the north pole to n. Use these global projection fields;
a global continuous choice of their eigenvectors is not an assumption.

Classify all densely defined self-adjoint A commuting with the translations
and U_s on their full invariant domains. In the Fourier picture they are
exactly the maximal matrix multipliers

`a(ξ)=Σ_m g_m(λ(ξ)) P_m(ξ/|ξ|)`, `λ(ξ)=4π²|ξ|²`, ξ≠0,

where each g_m:[0,∞)→ℝ is Borel. The value at ξ=0 has no effect. The
maximal domain is the set of f for which
`∫ Σ_m |g_m(λ(ξ))|² ‖P_m(ξ/|ξ|) f̂(ξ)‖² dξ < ∞`.
Prove uniqueness of each g_m modulo the radial measure ν₃ from QF6a,
and all converse, closure, conjugacy and spectral-projection formulas;
the latter symbol is `Σ_m 1_B(g_m(λ(ξ)))P_m(ξ/|ξ|)` for a Borel event B.
Boundedness and semiboundedness are exactly the corresponding common
essential bounds on this finite family. Obtain a graph core by the Fourier
cutoffs `|ξ|≤k` and `max_m |g_m(λ(ξ))|≤k`.

Supply the finite-multiplicity resolvent adapter: translations give a
measurable matrix resolvent field; injectivity and dense range recover an
a.e. finite Hermitian symbol. Rotation covariance and the multiplicity-one
little-circle weights in M3 diagonalize it in the displayed projections.
Carry out the measurable descent using the bounded resolvent and normalized
Haar averaging before recovering the real channel functions. Prove the
comparison with M3's direct integral, including its radial measure and
covered-circle convention. NQS retains ownership of that representation
decomposition; this block owns its Hamiltonian/domain/observable application
and supplies no input back to M3.

For j=0 recover QF6a.RadialHamiltonians in dimension3. For j=1/2 use the
usual Hermitian Pauli matrices and the explicit form
`a(ξ)=a₀(λ(ξ))I+b₀(λ(ξ)) n·σ`, n=ξ/|ξ|, with channel values a₀±b₀.
Prove the projectors are `(I±n·σ)/2`. Thus Euclidean covariance permits
spin-dependent channels. The fixed time-character model of source p20 has
all g_m≡E; for m_mass>0 the spin-independent free model has all
g_m(λ)=λ/(2m_mass).
The Galilei restrictions remain the separate NQS M3 application. Preserve
p21's faint Hamiltonian intertwining formula and bibliographic pointer
separately from this explicit model theorem.
[`SpinHamiltonianTargets.lean`](SpinHamiltonianTargets.lean) gives native
matrix calibration targets for the spin-half channels.

For Dooley p.29's proposed group extension, keep the printed claims about containing Poincaré/de Sitter groups separate from the explicit contraction model in NQS M5. Under M5's `η=diag(1,1,1,−1)`, use the real cochain `f(a,b)=η(a,b)/2` to change its symmetric central cocycle to `c_f(g₂,g₁)=−η(Λ₂a₁,b₂)−σ₁η(b₂,b₂)/2`. On the spatial Galilei subgroup this is `−v₂·R₂a₁−σ₁|v₂|²/2`; compare its central phase `exp(iκc_f)` with M3's convention by the resulting signed mass dictionary. On a positive spatial coordinate put `(a,b)=(q,p)`; then M5's alternating form `ω(x₂,x₁)=q₂p₁−q₁p₂` is `−B(x₂,x₁)` for QF's `B((q,p),(q′,p′))=p q′−q p′`, so the phase parameter changes sign when identifying those Weyl conventions. Derive both conversions from the displayed multiplication law. Consume the exact group and rescaling conventions recorded in the relevant source and cited primary papers; own a parameter dictionary to the chosen affine coordinates and rescaling parameter, derive the induced Lie brackets and subgroup inclusions under it, or state precisely which printed assertion has no such identification. Do not attribute proper-time variables to p.29 unless they are present in the cited source material. Do not identify the source group with `G₅` merely from matching names or a Lie-algebra contraction. For Dooley pp.16–17, `G=G₁×ℝ`; the ℝ factor supplies the trivial multiplier class `H²(ℝ,𝕋)=0` used there. The separate p.28 `G×SU(3)` example uses compact `SU(3)`, whose compact circle extension has type-I full group C*-algebra; consume NQS M2’s Borel-cochain/extension-product adapter for this p.28 example. In each case state the multiplier-factorization condition and any cross-multiplier obstruction. This application belongs here, after the NQS supplier, and creates no QF5→NQS cycle.

Consume D8’s bosonic Fock carrier with QF4’s second-quantization API and construct its
unitary comparison with the Schrödinger realization on `L²(ℝ)` by the Hermite basis.
Prove Hermite orthogonality, completeness, ladder identities, and the finite-particle/Schwartz core statements; consume UO-E03's generic essential-self-adjointness theorem and UO-E05's worked Hermite-core verification after verifying its hypotheses on this oscillator core. Compute the oscillator Hamiltonian's eigenvalues, spectral projections and evolution. An exact finite-dimensional CCR representation is impossible; for a
cutoff space prove the boundary commutator correction already stated in QF4.

**One-mode oscillator source adapter (Grundling pp.59,61,65).** In the declared units Q=x, P=−i∂ and ℏ=1, set `a=(Q+iP)/√2` and `a†=(Q−iP)/√2` on the Schwartz core. With the physicists' Rodrigues polynomials `H_n=(-1)^n e^(x²)(d/dx)^n e^(−x²)`, put `e_n=H_n e^(−x²/2)` and `h_n=(√π·2^n n!)^(−1/2)e_n`. Prove `‖e_n‖²=√π·2^n n!`, `h_0=π^(−1/4)e^(−x²/2)`, `h_n=(a†)^n h_0/√n!`, `a h_n=√n h_(n−1)` and `a†h_n=√(n+1)h_(n+1)` (with a h_0=0). Use the existing Hermite completeness theorem and native basis coordinates for the unitary `ψ↦(⟪h_n,ψ⟫)_n`. Preserve p.65's raw, oppositely oriented coefficient map: for `ψ=Σ_n h_n/‖e_n‖` the vector belongs to L² but every coefficient `⟪ψ,e_n⟫` equals1, so that raw sequence is not ℓ².

For coefficients `c_n=⟪h_n,ψ⟫`, prove that the closures of the Schwartz ladder expressions are mutual Hilbert adjoints with maximal domains `D(a)={ψ:Σ_n n|c_n|²<∞}` and `D(a†)={ψ:Σ_n(n+1)|c_n|²<∞}`. Prove `H=closure((P²+Q²)|_Schwartz)=2N+I`, `Hh_n=(2n+1)h_n` and `D(H)={ψ:Σ_n(2n+1)²|c_n|²<∞}`, and obtain its spectral projections and physical evolution by the existing diagonal calculus. Consume UO-E05 for the finite Hermite-span and Schwartz graph cores, verifying the actual ladder factorial estimates required by UO-E03 for Q and P; analyticity for AA* alone is not a general implication of analyticity for Q. The recorded p.61 ladder labels use the opposite momentum sign, and its assertion `D(A)=D(A*)=Schwartz` is not a statement about the full Hilbert adjoint: keep that source assertion separate from the true restriction identity `A^+=A*|_Schwartz` and these maximal closures. These one-mode number-domain formulas do not replace the general multimode fixed-mode domains already specified in QF4.

**Repeated Hermite/oscillator comparisons (Grundling pp.136–137,142,154,159).** Consume the implemented `TauCeti.hermiteFunction`, `hermiteFunction_oscillator`, `hermiteHilbertBasis`, `coe_hermiteHilbertBasis`, `hermiteHilbertBasis_repr_apply`, `hasSum_hermiteFunctionLp_expansion` and Parseval statements from the individual `TauCeti.Analysis.SpecialFunctions.Hermite.Function.Basic`, `.Oscillator`, `.HilbertBasis` and `.Parseval` modules. Prove the normalization identification between their probabilists' polynomial at √2x and the physicists' Rodrigues formula already fixed above, and the closed-operator/domain lift; do not reconstruct a separate Hermite basis or pointwise eigen-equation. Retain p.136's sign/weight/π normalization uncertainty. If the recorded π^(1/4) coefficient at n=0 is taken literally, its Gaussian has norm squaredπ; the adopted unit vector is the already specified π^(−1/4) Gaussian. This conditional comparison does not settle the glyph. UO-E05 owns the finite Hermite-span, Schwartz and compactly supported smooth operator graph cores; QF consumes that cutoff/core theorem.

Use the same native coordinate unitary to identify the one-mode finite Hermite ladder restrictions with UO's square-root weighted-shift example and hence their maximal closures/adjoints. For the existing H=2N+I realization prove `σ(H)=σ_p(H)={2n+1:n∈ℕ}`, `σ_c(H)=σ_r(H)=∅`, with one-dimensional eigenspaces. In p.142's resolvent proof, given an arbitrary ℓ² target sequence b, use `a_n=b_n/(z−2n−1)` for z off that discrete set. Both reciprocal and `(2n+1)/(z−2n−1)` are bounded sequences, which proves a∈D(H) and (z−H)a=b. The recorded fixed choice `a_n=1/(λ−2n−1)` has weighted coefficients tending to−1; bounded coefficients alone are not square-summable. Preserve this false intermediate assertion beside the corrected proof. For every Borel h give `D(h(H))={ψ:Σ_n|h(2n+1)|²|⟨h_n,ψ⟩|²<∞}` and the corresponding spectral projection sum; the latter converges strongly, not in operator norm in general. A normalized eigenstate evolves by e^(−itλ) under physical e^(−itH) and has constant expectations whenever they exist. P.140's printed iHψ=−iλψ conflicts with Hψ=λψ; the positive Stone convention gives+iλ. The term “bound state” alone supplies no separate spatial-localization theorem.

Give angular
momentum first on `L²(ℝ³)`: define `L=Q×P` on the Schwartz core, identify its rotation generators and separate radial/angular variables. On `L²(S²)` define the angular generators intrinsically from the rotation action on the smooth core and prove they agree with the angular factors of the `ℝ³` operators. Prove the commutation relations
`[L_j,L_k]=i ε_{jkℓ}L_ℓ`, identify `σ(L_3)=ℤ` and `σ(L²)={ℓ(ℓ+1):ℓ∈ℕ₀}` with
multiplicity `2ℓ+1` for the angular Casimir L² on `L²(S²)`, and prove the spherical-harmonic decomposition. On `L²(ℝ³)≃L²((0,∞),r²dr)⊗̂L²(S²)`, the radial factor makes each L² eigenvalue infinitely degenerate; distinguish this from the angular multiplicity. Include spin systems with
explicit cover, weights and generator normalization.

For Grundling p.61's angular construction retain the faint lowering expression as qualified source text; under the adopted convention the lowering operator is `L_x−iL_y`. The displayed factor `(x+iy)^ℓ f(r)` is a state only with its actual weighted radial integrability, which is not implied by `f∈L²(r²dr)` for arbitrary ℓ. A single fixed radial factor per angular mode cannot be dense: in any one mode choose a nonzero radial vector orthogonal to its chosen radial factor. Prove instead that finite sums `g_j(r)Y_(ℓ_j,m_j)` with `g_j∈C_c∞(0,∞)` are a common graph core for the self-adjoint angular Casimir and L_z on L²(ℝ³), by angular spectral truncation and radial density in each finite set of channels. Distinguish smooth test cores from the false inclusion of all C∞(ℝ³) in L².

As the finite worked table of p.62, use `dΩ=sinθ dθ dφ` and verify the normalized functions `Y_00=1/√(4π)`, `Y_10=√(3/(4π))cosθ`, `Y_(1,±1)=√(3/(8π))sinθ e^(±iφ)`, `Y_20=√(5/(16π))(3cos²θ−1)`, `Y_(2,±1)=√(15/(8π))sinθ cosθ e^(±iφ)` and `Y_(2,±2)=√(15/(32π))sin²θ e^(±2iφ)`. Prove their orthonormality and the eigenvalues m and ℓ(ℓ+1) for L_z and the angular Casimir. These are the source table's phase choices; do not mix their ladder coefficients with a different Condon–Shortley phase convention. The finite table does not replace the full spherical-harmonic decomposition or radial multiplicity theorem above.

**Repeated analytic and angular source comparisons (Grundling pp.209–216).** Consume the existing one-mode ladder closures, native Hermite basis/oscillator equation, UO-E03 and E05. Stars on the Schwartz ladder expressions are formal restrictions of their maximal Hilbert adjoints, not assertions that the full adjoint domain is Schwartz. Every word of k ladder factors on h_n has norm at most `√((n+k)!/n!)`, including zero-annihilation branches. After expanding2^k words, the majorant `(2|t|)^k√((n+k)!)/k!` has successive ratio `2|t|√(n+k+1)/(k+1)→0` for every finite t. Thus finite Hermite vectors are entire analytic for Q and P; p.210's t<1/2 is sufficient but unnecessarily restrictive. The source's `a=(Q−iP₊)/√2` uses P₊=+i∂, while the adopted physical momentum is−i∂. A domain containing the Hermite span gives the oscillator ESA conclusion when it is a symmetric restriction of the same maximal expression, not for an arbitrary domain/action.

Retain all three p.214 angular components with their printed signs. They are the negatives of the adopted `L=Q×(−i∇)` expressions; in particular the adopted L_z is−i∂φ. Reversing all three changes the Lie bracket sign, so p.214 cannot be combined unchanged with p.211's+iε relation. Its Casimir formula IS correct as grouped: the outer(sinθ)^(−1) multiplies the inner(sinθ)^(−1), giving the standard−sin^(−2)θ azimuthal coefficient. Do not record a missing-power defect. Keep p.211's unclear spatial superscript and Levi-Civita aside unresolved. The integral labels m²≤ℓ(ℓ+1) give |m|≤ℓ and equality onlyℓ=m=0. The sphere multiplicity2ℓ+1 differs from the infinite radial multiplicity in ℝ³. P.216's analytic radial/angular domain means finite angular sums with arbitrary radial L² factors, not the completed full tensor space. Pp.212–213 retain the weighted-integrability and radial-density qualifications already stated for p.61's lowering construction. Common eigenvectors of all three represented components must have zero angular eigenvalues; this is distinct from common eigenvectors of L² and L_z and is not inferred merely from vanishing expectations in Robertson's lower bounds.

### QF6b.SharedKummer — confluent hypergeometric analysis

Use the native Gamma-normalized regularized hypergeometric function `M(a,b,z)=Γ(b)·regularizedHGFun({a},{b},z)`, for b outside the nonpositive integers. QF6b owns the shared Kummer analytic interface for all complex a and all b: use `ℳ(a,b,z)=regularizedHGFun({a},{b},z)` at every b, and `M=Γ(b)ℳ` where b is not a nonpositive integer. Own the ODE, Kummer transformation and uniqueness with the stated initial/branch data. Construct Tricomi U on the principal slit plane `ℂ∖(−∞,0]` from
`U(a,b,z)=Γ(a)⁻¹∫₀∞e^(−zt)t^(a−1)(1+t)^(b−a−1)dt`
for Re a>0 and Re z>0. Prove compact-parameter domination of this integral and holomorphy in a,b,z on that region. Continue in z along the Kummer ODE on paths avoiding0, with uniqueness and holomorphic parameter dependence, fixing the principal slit branch and then its logarithmic cover. Derive by integration by parts on the common Laplace region the recurrence
`U(a−1,b,z)=(z+2a−b)U(a,b,z)−a(a−b+1)U(a+1,b,z)`
([DLMF13.3.7](https://dlmf.nist.gov/13.3#E7)). Use it without division to extend one left half-strip in a at a time, prove agreement on overlaps and derive entire dependence on a,b. Prove the contour-deformation and uniform bounds used for sectorial asymptotics, respecting the branch points at t=0,−1 rather than rotating through them. Own continuation on the logarithmic cover and the specified upper/lower boundary branches. At integer b derive the limits with their logarithmic origin terms and terminating exceptions, including [DLMF13.2.9–13.2.11](https://dlmf.nist.gov/13.2#E9); the singular expression `z^(1−b)M(a−b+1,2−b,z)` is not its definition. With `W(f,g)=fg′−f′g`, prove the all-b identities
`W(ℳ,U)=−e^z z^(−b)/Γ(a)` and
`ℳ(a,b,z)=e^(∓πia)U(a,b,z)/Γ(b−a)+e^(±πi(b−a))e^zU(b−a,b,e^(±πi)z)/Γ(a)`.
**QF6b.SharedKummer singular-parameter uniqueness.** Pin the holomorphic solution data rather than infer uniqueness at a regular singular point from value and first derivative. For ℳ use its native coefficient `c_k=(a)_k/(k!Γ(b+k))` and prove `(k+1)(b+k)c_(k+1)=(a+k)c_k`, also at exceptional b by reciprocal-Gamma continuation. If b is not a nonpositive integer, c₀=1/Γ(b) determines the holomorphic solution. If b=−N with N∈ℕ, prescribe both c₀ and `c_(N+1)=(a)_(N+1)/(N+1)!`; the singular recurrence step does not determine that coefficient from c₀. Prove existence by the native convergent series and uniqueness coefficientwise with these data. For U continue the Laplace solution by the regular-point value/derivative data on the chosen logarithmic cover. At a nonpositive integer a, the Wronskian of ℳ and U vanishes, so U is not asserted to be an independent second solution there. Whenever a fundamental pair is required, choose a nonzero regular point z₀ and the two normalized initial-data solutions (value,derivative)=(1,0),(0,1), continue them on the cover and derive their origin/logarithmic comparison; include the terminating/resonant degeneracies in that comparison. This refines the same shared Kummer carrier and analytic interface; it does not define another hypergeometric series.

Use reciprocal Gamma with its zeros at the nonpositive integers; native `Complex.Gamma` equals0 at those arguments, so its totalized reciprocal/division notation has the same values. The all-b Wronskian therefore needs no extra nonpole hypothesis on a. The rotated argument carries its indicated logarithmic branch; on principal branches use the upper signs for −π<arg z<0 and lower signs for 0<arg z<π, with boundary values stated separately. Prove the sectorial asymptotic `U(a,b,z)~z^(−a)` for `|arg z|≤3π/2−δ` on that cover, its differentiated forms and locally uniform parameter estimates on compact sets. Own the regular-singular logarithmic expansions and the large-argument Γ-coefficient formulas including the exceptional terminating parameters. As the named generic terminating identity QF6b.T, prove for every n∈ℕ and b outside the nonpositive integers
`M(−n,b,z)=Σ_(0≤k≤n)(−n)_k z^k/((b)_k k!)`,
with exact degree n. Prove the Laguerre comparison `L_n^(a)(x)=((a+1)_n/n!)M(−n,a+1,x)` in the supplied Laguerre parameter range. RQFT9 consumes QF6b.T and owns its relativistic parameter/degree adapter. [DLMF13.2,13.4.4,13.7](https://dlmf.nist.gov/13.2) pins this shared interface; RQFT9 consumes it for its generally noninteger b, and owns each relativistic parameter/domain adapter.

**Repeated two-particle and Coulomb source comparisons (Grundling pp.216–221).** Use the adopted positive masses, physical momenta−i∇ and signed+α/r model below. For `R=(m₁x₁+m₂x₂)/M`, `r=x₁−x₂`, prove `∇_(x₁)=(m₁/M)∇_R+∇_r` and `∇_(x₂)=(m₂/M)∇_R−∇_r`. These give total momentum−i∇_R, relative momentum `(m₂P₁−m₁P₂)/M=−i∇_r`, and the displayed reduced-mass kinetic energy. P.216 instead prints P_j=+im_j∇_(x_j). Those expressions give total momentum `i[(m₁²+m₂²)/M∇_R+(m₁−m₂)∇_r]` and weighted relative momentum `iμ[(m₁−m₂)/M∇_R+2∇_r]`; they do not imply p.217's printed iM∇_R and iμ∇_r. Preserve both literal assertions and the217−α/r versus216+α/r change separately. They are not resolved by a sign convention alone.

Apply UO-E06's exact ℝ³ local/tail Coulomb decomposition and its transferred C_c∞ graph core. At radius R the tail norm is≤|α|/R, so a desired ε uses R>|α|/ε; the printed radius1/ε only bounds it by|α|ε. Retain p.219's dimension-free L² claim as a source error already qualified by E06. Justify p.218/219's displayed center-of-mass/Coulomb tensor graph core with the independent degree1 tensor-sum theorem, not a premise that all compactly supported Coulomb test vectors are analytic. Use its full joint-moment closure and unitary domain transport.

Here the free spectrum equals its essential spectrum[0,∞), so relative compactness implies that set is included in the interacting spectrum; this is not a general inclusion theorem for relatively compact perturbations. Differing points are discrete finite-multiplicity eigenvalues, allowed to accumulate at essential spectrum or infinity. Essential-spectrum invariance alone does not identify σ_c or exclude singular-continuous spectrum; the radial spectral construction below supplies those stronger conclusions. Multiplying H_rel by2μ also rescales energy and replaces α by2μα in the source's unit-coefficient radial equation. The unitary radial map u=rR and the correct origin/infinity domains are already specified below. Local power-series convergence alone does not quantize energy. The endpoint and L² conditions yield `−μα²/(2n²)` only for attractive α<0; the repulsive branch has no point spectrum by the separately stated continuum theorem. A degenerate energy eigenvector can mix angular weights; the proved rotation-domain covariance and bound-state completeness provide a CHOSEN joint eigenbasis, not a claim that every energy eigenvector is individually an angular eigenvector.
For the hydrogen model on `L²(ℝ³×ℝ³)`, take masses m₁,m₂>0, ℏ=1 and signed Coulomb coefficient α. Pin `H=−Δ_(x₁)/(2m₁)−Δ_(x₂)/(2m₂)+α/|x₁−x₂|`. For `R=(m₁x₁+m₂x₂)/(m₁+m₂)`, `r=x₁−x₂`, total mass M=m₁+m₂ and reduced mass μ=m₁m₂/M, construct the center-of-mass unitary and prove `H=−Δ_R/(2M)+H_rel`, `H_rel=−Δ_r/(2μ)+α/|r|`, on a stated core and on the resulting self-adjoint domains. For `H_rel` on `L²(ℝ³_r)` with arbitrary μ>0, prove the
Coulomb multiplication is infinitesimally `−Δ`-bounded and relatively compact by UO-E06's exact `ℝ³` `L²+L∞`/decay hypotheses; verify that `1/|r|` satisfies them after a local/tail decomposition. Use UO-E06, not a dimension-free L² claim. In the partial-wave decomposition, identify each radial operator on `L²((0,∞),dr)` and its boundary condition at zero. After multiplying the reduced radial Hamiltonian by
`2μ`, its expression is `−u″+ℓ(ℓ+1)u/r²+2μαu/r`. Consume UO-D07 with
`ν=ℓ+1/2` and `b=−2μα`, and UO-D06's Friedrichs form realization.
For `ℓ=0`, zero is limit-circle and the Friedrichs condition is `u(0)=0` in
the appropriate maximal-domain trace sense; for `ℓ≥1`, zero is limit-point.
Infinity is limit-point. Prove the partial-wave unitary, the parameter adapter,
and agreement of the Friedrichs realization with the full hydrogen domain. Consume [LaguerreJacobi A1–A3 and B1–B4 contract (PR #117)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/86ae915518d82e35110047d89192510519fce2b3/TauCetiRoadmap/LaguerreJacobi/README.md#part-a--the-laguerre-family-algebraic) for the generalized Laguerre recurrence, derivative, Rodrigues formula, orthogonality constant `Γ(k+a+1)/k!`, and complete weighted and square-root-envelope bases for `a>−1`. Use its named weighted measure on `(0,∞)` and element-level basis normalization. Specialize by an explicit parameter/dilation adapter to each radial channel. QF owns the radial substitutions, the radial normalization adapter `∫₀∞ x^(a+1)e^(−x)(L_k^(a)(x))² dx=(2k+a+1)Γ(k+a+1)/k!`, and comparison with physical operator domains. Hydrogen bound eigenfunctions alone do not span the full radial space. For every signed α and every angular momentum ℓ, prove that the radial Coulomb operator has no L² eigenfunction for E≥0, including E=0. For α≥0 use its nonnegative Friedrichs form to exclude negative eigenvalues; for α<0 retain the negative Laguerre eigenstates below. For `k>0`, define `(\mathrm{CoulombTransform}_ℓu)(k)=√(2/π)∫₀∞F_ℓ(μα/k,kr)u(r)dr`, with the following owned analytic construction. Consume the preceding QF6b.SharedKummer and QF6b.T analytic interface for the following radial construction. Define `F_ℓ(η,ρ)=C_ℓ(η)ρ^(ℓ+1)e^(iρ)M(ℓ+1+iη,2ℓ+2,−2iρ)`, `C_ℓ(η)=2^ℓe^(−πη/2)|Γ(ℓ+1+iη)|/(2ℓ+1)!`. Prove real-valuedness, the regular-origin normalization and Coulomb equation `F″+(1−2η/ρ−ℓ(ℓ+1)/ρ²)F=0`. Define `θ_ℓ=ρ−η log(2ρ)−ℓπ/2+σ_ℓ(η)` and
`H_ℓ^±(η,ρ)=e^(±iθ_ℓ)(∓2iρ)^(ℓ+1±iη)U(ℓ+1±iη,2ℓ+2,∓2iρ)`
with the principal logarithms at the indicated imaginary arguments. Set `G=(H^++H^-)/2` and prove `H^±=G±iF`, conjugacy and real-valuedness of G. Prove the ODE and `W(G,F)=W(H^±,F)=1` with ρ derivatives, then its radial-r derivative adapter. These are [DLMF33.2.8–33.2.12](https://dlmf.nist.gov/33.2#E8) with exactly the stated normalization. Prove the unit-amplitude asymptotic with phase `ρ−η log(2ρ)−ℓπ/2+σ_ℓ(η)`, where σ_ℓ is the continuous phase of Γ(ℓ+1+iη) normalized by σ_ℓ(0)=0; principal arg alone does not specify this continuous branch. Prove the derivative asymptotics and local uniform estimates in k on compact subsets of k>0 needed for the spectral boundary limits. [DLMF33.2](https://dlmf.nist.gov/33.2) fixes the normalization and phase, and [33.10–33.11](https://dlmf.nist.gov/33.10) fixes the asymptotic convention; these analytic targets are built here, not assumed from the function’s name. Prove this transform is unitary from the absolutely continuous radial subspace onto `L²((0,∞),dk)` and intertwines the radial Friedrichs operator there with multiplication by `k²/(2μ)`; own the following model-specific Weyl–Kodaira expansion proof, in addition to UO-D07’s endpoint/domain classification. For nonreal z take `β=√(−2μz)` with Re β>0, `a_z=ℓ+1+μα/β`, `b=2ℓ+2`, and construct
`φ_z(r)=e^(−βr)(2βr)^(ℓ+1)M(a_z,b,2βr)`,
`ψ_z(r)=e^(−βr)(2βr)^(ℓ+1)U(a_z,b,2βr)`.
Prove the origin condition for φ_z, square integrability of ψ_z at infinity, their analytic dependence and `W_r(φ_z,ψ_z)=−2βΓ(2ℓ+2)/Γ(a_z)≠0`. For z→E+i0, E=k²/(2μ)>0, prove β→−ik and
`ψ_(E+i0)=i^ℓe^(−πη/2−iσ_ℓ(η))H_ℓ^+(η,kr)`;
the lower boundary is the conjugate. Establish convergence of φ_z,ψ_z and W, with their r derivatives, locally uniformly for r in compact subsets of (0,∞), uniformly for E on compact positive intervals and bounds uniform in `0<|Im z|≤ε₀`. The analogous kernel bounds must hold on compact (r,s) sets, including r=s, to justify compact-test integration. Derive these estimates from the shared U/connection interface, rather than only stating pointwise boundary values. With `W(φ,ψ)=φψ′−φ′ψ`, prove that the kernel of `(H_ℓ−z)⁻¹` is `−2μ φ_z(r_<)ψ_z(r_>)/W(φ_z,ψ_z)`, first on compactly supported data and then as the actual bounded resolvent. Derive its positive-energy boundary jump from the connection/Wronskian identities: for E=k²/(2μ), its upper-boundary imaginary kernel divided by π is `(2μ/(πk))F_ℓ(μα/k,kr)F_ℓ(μα/k,ks)`. State this as a tested kernel identity with locally uniform bounds on compact positive-energy intervals. Own QF6b's scalar Stieltjes inversion lemma on native `MeasureTheory.resolventTransform`: for a finite positive Borel μ on ℝ, `F(z)=∫(λ−z)⁻¹dμ(λ)`, a<b and ε↓0, prove
`π⁻¹∫_a^b Im F(E+iε)dE → μ((a,b))+(μ{a}+μ{b})/2`.
Prove that uniform convergence of `π⁻¹Im F(E+iε)` on a compact interval I to a continuous g implies `μ|_I=g dE`, including the absence of endpoint atoms. Derive the first statement by Fubini from the Poisson kernel and its bounded arctangent primitive, then use dominated convergence; derive the density statement by compactly supported testing. Apply it to the finite scalar spectral measures from SAST SA-E01/SA-E05 and use polarization for mixed compact-test pairings. UO/SAST uses `R_A(z)=(zI−A)⁻¹`; this positive-imaginary F is the pairing with `(A−zI)⁻¹=−R_A(z)`. Prove this sign adapter and the passage under the compact-test kernel integrals using the preceding uniform ε bounds. Calculate every negative pole and its normalized bound-state projection. For α≥0 the nonnegative Friedrichs form excludes the whole negative axis. For α<0 and any compact negative interval avoiding the displayed bound energies, prove β,φ_z,ψ_z and 1/W continue analytically through that interval, with the real symmetric limiting kernel and compact-test bounds uniform in the imaginary part. Scalar inversion with g=0 excludes measure there. A countable such interval cover leaves only the bound poles on the negative axis; prove separately that there is no atom at zero. These bounds and inversion show that no singular-continuous measure remains; endpoint classification or a Green identity alone does not establish completeness. Prove Parseval on a dense compact-test subspace with the bound-state coefficients included. Prove that the closed range of the transform is invariant under every `L∞(dk)` multiplier by intertwining with the bounded Borel calculus, using E=k²/(2μ) to identify all such multipliers up to null sets. It is reducing, since the adjoint multipliers are included. Own the scalar multiplier-commutant lemma identifying its range projection with multiplication by `1_S` for a measurable set S. Use a countable dense family of compact tests and the nonzero regular solution field at almost every k to show S is conull; otherwise every test transform would vanish there and force the regular solution to be zero. This proves the onto step and the one-dimensional radial spectral-fiber identification before extending to the stated unitary. This is an owned Coulomb-family eigenfunction-expansion theorem, not an uncited generic half-line theorem; it covers α≥0 with no bound-state summand as well as α<0. For α<0 include the negative bound-state coefficients as the complementary `ℓ²({n:n>ℓ})` summand in the full radial spectral representation. This establishes purely absolutely continuous spectrum `[0,∞)` of multiplicity one in each radial channel. In the full relative space, prove the negative bound energies `−μα²/(2n²)` have `0≤ℓ<n` and total multiplicity `Σ_{ℓ<n}(2ℓ+1)=n²`; the complementary spectrum is absolutely continuous `[0,∞)` with countably infinite multiplicity. QF owns these continuum and bound-state spectral claims, not merely an unspecified continuous part. QF then proves the eigenfunction-to-operator-domain comparison and the resulting spectral decomposition; do not assume a differently normalized Laguerre-Jacobi theorem supplies these identities without an explicit parameter adapter. Then deduce `σ_ess(H_rel)=[0,∞)`, solve the radial equation and derive the
bound spectrum only for attractive coupling `α<0`, with multiplicities and domain conditions.
Use the center-of-mass tensor sum to prove, for α<0, the full two-body operator has
`σ(H)=σ_ess(H)=[−μ α²/2,∞)`, and for α≥0 both spectra are `[0,∞)`; do not transfer relative compactness or the relative essential-spectrum formula to the full translation-invariant operator.
Include expectation and transition-probability computations for the stated ground and excited
states, with absolute first-moment integrability `∫|f|dμ<∞` for every unbounded observable used. Prove covariance of the closed hydrogen Hamiltonian under the rotation unitary group, including its domain, before applying UO-B03 strong commutation to angular-momentum generators. Retain Grundling p.220's core-only inference as a source gap. For rotation-invariant Fourier multipliers, consume QF6a's `(−Δ)²` counterexample and restricted constant-coefficient symbol theorem; do not duplicate that theorem here.

Define finite composite outcomes using VNA V2's completed Hilbert tensor product. For countably
many factors, fix unit reference vectors `ξ_n` and consume VNA V2's incomplete tensor product,
the completion of finite-prefix tensors under `v↦v⊗ξ_(n+1)`. The provider separately states two
reference questions. For factor unitaries `U_n:H_n≃ₗᵢ[ℂ]K_n`, put `ζ_n=U_nξ_n`.
Consume V2’s raw-prefix Cauchy criterion for these identified local models: the literal, unadjusted prefix vectors in the η-component are Cauchy exactly when, after discarding
any finite initial prefix (including any initial zero overlaps), their complex tail products
`∏⟨η_n,ζ_n⟩` tend uniformly to 1; equivalently only finitely many overlaps vanish and the partial products after the last zero
converge to a nonzero value. The condition `Σ|1−⟨ζ_n,η_n⟩|<∞` is sufficient for this raw convergence,
not necessary; alternating signs give a counterexample to treating `Σ(1−|⟨ζ_n,η_n⟩|)` as a
raw-prefix criterion.

The distinct weak reference-equivalence theorem is owned by VonNeumannAlgebras V2. It concerns existence of a unitary intertwining the specified local `B(K_n)` representations under the factorwise identifications induced by `U_n`, and V2 proves its phase-adjusted summability criterion, isometry on dense finite-excitation tensors, and uniqueness up to phase. QF6b consumes that criterion for its specified local `B(K_n)` representations. The criterion is not raw-prefix convergence and does not classify arbitrary isomorphisms of von Neumann closures. Neither roadmap redefines a generic countable tensor product or treats binary parenthesization as sufficient.

Specify states on the resulting Hilbert space as normal exactly when represented by a trace-class density operator there; consistent finite-cylinder marginals alone do not imply normality in that representation. Define countable composite outcome laws first on finite-cylinder events and prove their extension to the product σ-algebra under the standard-Borel/countable-product hypotheses. Construct finite iterated identifications and prove coherence/unitary associativity. In infinite dimension define separability of a state as trace-norm closure of the
convex hull of product density operators, not as a finite convex sum. Retain separability of
Hilbert spaces as an explicit hypothesis whenever countable bases or separable orbit theory are
used.

Provide model-facing interfaces for locally compact symmetry groups, covariant PVM systems,
induced representations and little-group data. Consume
[NoncompactQuantumSymmetry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/777a2fe3ffc684a050706105ad99efcacd7ac07a/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md) at the following exact
milestones, under their lcsc/standard-Borel/separability and measure-class hypotheses:

- M0 supplies Gårding smooth vectors, differentiated group actions, common invariant domains,
  and the Hermitian Casimir closure theorem with its elliptic-commutation hypotheses.
- M1 supplies systems of imprimitivity on `G/H`, square-root Radon–Nikodym/modular normalization,
  Borel multipliers and central extensions, Borel selectors of standard-Borel homogeneous quotients,
  and twisted imprimitivity. QF5 owns the countable local-section patching construction for locally sectioned central
  extensions; M1 consumes that construction in its local-section case and owns the general
  standard-Borel homogeneous-quotient selector and extension reconstruction.
- M2 supplies the regular Mackey orbit/stabilizer classification. For a genuine split `N⋊H`,
  the character extends genuinely to `N⋊Hχ` and the little-group multiplier is trivial.
  Global twists and nonsplit extensions carry their specified obstruction data; a twist
  nontrivial on `N` requires the actual projective normal-subgroup dual. Irreducible exhaustion
  uses the regular-action hypotheses; type I is required separately where used for product
  decomposition and unique disintegration. M2 owns those hypotheses and theorems.
- M3 supplies Euclidean `ℝ⁴⋊SO(3)` and its rotation cover, the Galilei/Bargmann mass extension,
  and the fixed-convention position/boost commutator. M4 supplies all six Poincaré momentum
  orbit types (future/past timelike, spacelike, future/past nonzero null, and zero), their
  `SU(2)`, `SL(2,ℝ)`, `Δ≅ℂ⋊(ℝ/4πℤ)` and `SL(2,ℂ)` stabilizers, massive/helicity/continuous-spin
  representations, mass-squared and central-character conventions, and time-reversal comparisons.
  QF6b also consumes M4's selected positive-energy one-particle
  [Wightman localizability construction and obstruction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c7a2df4a947643b3d8e5646d33266089bde9b941/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md#L842-L857).
  For each admitted selected Poincaré model, use its supplied fixed-time
  spatial localization PVM with its spatial Euclidean covariance group.
  For a shared normalized state `φ_α` normal on the abelian von Neumann
  algebra generated by that PVM (in particular any normal state on B(H)),
  prove the operational event law `Pr_α(E)=φ_α(P(E))`. For every real
  coordinate or real Borel function of the localization outcome, transport
  its pushforward PVM to the corresponding QF1 observable and marginal
  outcome law. Prove the supplied model intertwiners preserve these laws;
  for excluded models retain the supplier's obstruction under its exact
  covariance and little-group hypotheses. Keep this spatial localization
  distinct from M4's explicit
  [full-spacetime sharp-PVM/positive-energy obstruction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6afdcaea14fd4be5cdff6df091710bbc70aaa02/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md#L684-L691).
  Neither comparison is a field-locality or local-net theorem.
- M5 supplies the de Sitter classification for `diag(−1,−1,−1,−1,+1)`, connected groups and
  covers, both Casimir normalizations and contraction limits. M5 also owns the concrete 15-dimensional
  affine `G₅`, its group law and inverse, the specified `ISO₀(3,2)` Lie-algebra
  contraction, and its normalized phase cocycle; QF6b consumes these exact
  targets for the Dooley p.29 comparison. M6 supplies the induced-model tensor-product
  decomposition with its type-I/separability, measure-class and multiplicity hypotheses.

QF6b specializes these representations to quantum models: construct the compatible observable
representation and chosen state family, transport the covariant PVM to its outcome probabilities,
identify the translation/rotation/boost generators on the supplied common domains, and prove
that the induced-model intertwiners preserve the outcome laws. Use M3–M5's exact metric signature,
cover, central character, Casimir and antiunitary conventions in these comparisons. For tensor
products consume M6's decomposition and derive its state and measurement interpretation, with
all multiplicity spaces and measure classes retained. QF5 supplies its ray-action and locally
continuous spin-extension comparisons before these NQS applications. QF6a is standalone; QF6b consumes M0–M6 and supplies none of their prerequisites. OperatorAlgebraDynamics D1/D3, HilbertModules H3 and VonNeumannAlgebras
V4/V11 remain the underlying covariant-pair, Green-induction, spectral and Fourier suppliers
consumed through the stated NQS interfaces. The generic imprimitivity and noncompact
classification theorems have NQS as their single owner.

QF5 owns the source's `ℝ⁴` continuous-multiplier example and proves the alternating-bilinear-form classification. NQS M3 owns Galilei conventions and time reversal. NQS M4 owns the source's zero-based time-last Poincaré/Lorentz conventions, including `diag(−1,−1,−1,+1)`, `Q(p)=−p₀²−p₁²−p₂²+p₃²`, its real square-root sector, `SL(2,ℂ)→SO₀(3,1)` and antiunitary time reversal. M6 is the literal/corrected source-pair register and consumes M3/M4; it is not the convention owner. QF6b consumes those pinned conventions; it does not duplicate their correction proofs. The connected-ray-component result used by NQS M4 is also a QF5 target. Keep negative Galilei mass/antiparticle language as an interpretation of the explicitly defined representation, not a theorem about all models.

RelativisticQuantumFieldTheory is the separate supplier for free fields as operator-valued distributions on D8/QF Fock carriers; RQFT4 states Wightman or Haag–Kastler axioms and locality and proves spin-statistics only with its hypotheses; RQFT10 proves the bosonic Shale criterion for implementability of bounded real symplectic maps in the specified regular Fock representation; equivalence claims are restricted to the corresponding regular representations and are not a classification of all CCR representations. These do not follow from the Hilbert-space axioms here. RQFT5 owns formal graph combinatorics, RQFT6 owns distributional realization/extensions/renormalization, RQFT7 owns Euclidean continuation, and RQFT8 owns scattering under its stated construction and domain hypotheses.

The source-facing assignments are specific: Grundling p.106's request to treat spin–statistics is an RQFT4 target under its field, locality, spectrum, positivity and domain axioms; QF6b owns the explicit separable infinite-dimensional regular CCR family for p.120 Remark 2 and consumes RQFT10's Shale criterion for its pairwise inequivalence. In the concrete free-field comparison, RQFT10 supplies the Shale implementability criterion; it does not by itself classify every representation of every infinite-dimensional CCR algebra; Dooley p.15 literally gives the group representation `⊕_{n≥1} Sym^n(H₁)`; this is the positive-particle subspace of `Γ_s(H₁)`, not a carrier for creation/annihilation fields, which can move vectors into or out of the vacuum sector. QF6b uses RQFT3's physical transverse-photon one-particle space and NQS M4's helicity `±1` representations, then restricts QF4's `Γ_s(H₁)` representation to `⊕_{n≥1} Sym^n(H₁)`. A physical-transverse-photon realization uses the symmetric Fock space over RQFT3's transverse one-particle space; a gauge-fixed indefinite-metric realization uses its separately specified indefinite state space and subsidiary condition; an observable-net realization uses the local gauge-invariant observable algebra and its Hilbert representation. State which carrier is used and prove its constraints there. QF supplies second-quantization APIs on D8's carrier; D8 supplies the CCR/Weyl algebra and basic field operators; RQFT supplies the field construction and its axioms. The source's broader suggestion about general quantum fields remains a research question, not a theorem that every field is obtained by this construction.


## Source examples and convention register

The accompanying course materials are acceptance examples, not authority for unstated
hypotheses. Preserve Dooley p.14's two literal clauses: every pair of one-particle states has a corresponding product state, and every composite state is determined by a pair. Under the explicit product-state interpretation, the second universal converse is false in general; retain it beside the Bell-state counterexample. Preserve the literal wording “determined by a pair” as a bounded semantic question: do not identify product-state factorization with determination by marginals without stating and checking that interpretation. The recorded QF1 source claims include Dooley p.1's Mackey-to-Segal embedding and p.8's proposed product-space extension. QF1.S.GudderBoyce gives the cited paper's actual Segal-to-weak-Mackey realization with the full Segal state set, opposite to Dooley's printed arrow. The precise product-space and selected-normal-state Hilbert-model targets above retain their own explicit hypotheses; the literal sentences are not unrestricted embedding or reconstruction theorems. Use the literal orthocomplemented-poset axiom (v) and countable-convex/full-family definitions recorded in QF1; retain the source’s unstated `ℝ⁺` convention separately. Dooley p.13(ii) states that the only possible multiplier for `ℝ` is the identity and concludes that the one-parameter projective representation is a representation. Preserve that literal assertion and prove the precise corrected statement: under the stated continuity assumptions the multiplier is a coboundary, so phases can be chosen to give a strongly continuous unitary lift. A chosen multiplier need not itself be identically one. No failure-to-lift assertion is attributed to this source. For `E(3,1)`, state the full inhomogeneous Lorentz (Poincaré) group as `ℝ⁴⋊O(3,1)`, which contains time reversal; only the connected proper orthochronous subgroup is restricted to its unitary component by connectedness. The materials include: Dooley, *Foundations of Quantum Mechanics* (all 34 source pages); Grundling,
*MATH3680 Quantum Mechanics* (all 225 transcript pages); and Rieffel, *Noncommutative
Geometry* (the 8-page excerpt and its cited passages). Each example is proved under the
hypotheses written in the milestone that owns it. Source statements that conflict with the
mathematics are retained as source claims in the transcript and corrected in the target theorem.

Use Fourier transform `Ff(ξ)=∫ f(x)e^(−2πi x·ξ)dx`, position `Q_j f=x_jf`, momentum
`P_j=−i∂_j` on its self-adjoint Sobolev domain, and hence `F P_j F⁻¹=M_(2πξ_j)`. For
unitary dynamics use `U(t)=e^(−itH)` for physical time evolution; Stone generators elsewhere
retain the SAST convention `e^(itA)` and are related by `A=−H`. Weyl conventions must be
derived from the chosen field normalization: under the convention declared in QF4,
`W(f)W(g)=e^(−i Im⟨f,g⟩/2)W(f+g)`. Transcribed source field-commutator and Weyl
formulas are separate assertions: derive each sign from the chosen convention on the common
invariant domain and record the p.111/p.113 source inconsistency. State every Fourier
normalization, multiplier phase and group action sign when translating a source formula. For a coordinate change
`y=Tx`, for invertible linear `T`, the unitary `U_T f(y)=|det T|^(−1/2) f(T⁻¹y)` includes the absolute determinant; for a smooth diffeomorphism use the pointwise Jacobian `|det D(T⁻¹)(y)|^(1/2)` from QF6a.

**Introductory particle and domain comparisons (Grundling pp.121–126).** Relate the source's vector-state language to QF1/QF3's normalized vectors, rays and general positive-functional states; retain its separability preference as a model choice. For the negative-2π Fourier convention on the Schwartz core, prove `F⁻¹M_ξF=(2πi)⁻¹∂`. If the physical Planck constant is written h, require `ℏ>0`, set `h=2πℏ` and prove `P_h=hF⁻¹M_ξF=−iℏ∂`, with actual self-adjoint domain H¹, and `[P_h,Q]=−iℏI` on the common Schwartz core. Retain the p.122 intermediate equality that drops h separately from this scale comparison; the p.121 h/overbar and p.122 overwritten function/hat glyphs remain unresolved. The Fourier integral is an ordinary integral on L¹∩L², then a unitary Plancherel extension on all L²; delta functions and plane waves in the informal change-of-basis description are distributional kernels, not vectors of L²(ℝ).

For p.123, use a strongly continuous group of complex-linear unitaries in the Stone correspondence. The recorded group and norm-preservation conditions alone do not state those hypotheses: `U_t x=exp(it‖x‖)x` on ℂ is a norm-preserving transformation group that is not complex-linear. With the adopted `U_t=exp(itH)` generator convention, take `ψ∈D(HA)∩D(AH)` and assume `U_(-t)ψ∈D(A)` for all sufficiently small real t and `A((U_(-t)ψ−ψ)/t)→−iAHψ` as nonzero t→0. Prove `d/dt(U_t A U_(-t)ψ)|_(t=0)=i(HA−AH)ψ` by the two difference quotients and strong continuity; invariance of a domain alone is not substituted for this graph differentiability assumption; QF3's physical `exp(−itH/ℏ)` uses its separately stated scale and sign. Preserve the undecipherable Schrödinger action and clipped symmetry condition without supplying unseen factors. Preserve p.124's uncertain dense-domain overline separately from equality with the whole Hilbert space. Consume native Hellinger–Toeplitz for an everywhere-defined symmetric linear map, and use complex polarization for the real-expectation symmetry criterion; a bounded operator on a proper dense domain is replaced by its unique continuous extension only when that replacement is stated.

For p.126 prove Q is unbounded using the unit vectors `1_[a,a+1]`, whose image norm squared is `a²+a+1/3`, and prove its maximal domain is dense by the compactly supported smooth subspace. Complete the two accompanying exercises on the same L² carrier. For the literal `P_+=i∂` use its maximal H¹ domain and a fixed unit smooth compactly supported χ with `u_k(x)=exp(ikx)χ(x)`: `‖P_+u_k‖≥k−‖χ′‖` for positive k. For the oscillator's closed realization of `P_+²+Q²`, the same core vectors give
`(P_+²+Q²)u_k=exp(ikx)(k²χ−2ikχ′−χ″+x²χ)`.
Its norm tends to infinity by the reverse triangle inequality, and its domain is dense since it contains the Schwartz core. Consume UO-E05 and QF6b's oscillator core/closure identification for the self-adjoint realization; do not infer maximal-domain equalities merely from these core estimates. These comparisons keep the source's +i derivative exercise separate from QF3's physical −iℏ derivative convention.

**Grundling pp.64–65 Hilbert-space source comparisons (QF6b).** Use the native complete complex inner-product carrier, `HilbertBasis.repr`, `HilbertBasis.repr_apply_apply` and `HilbertBasis.hasSum_repr`. For an orthonormal basis b, the complex-linear coordinate map is `x↦(⟪b_i,x⟫)_i` and `x=Σ_i⟪b_i,x⟫b_i`. Preserve the recorded p.64 expansion with `⟪x,b_i⟫` and the p.65 map `f↦(⟪f,e_n⟫)_n` separately: the former reconstructs −i from x=i and b=1 in ℂ, and the latter is antilinear. The recorded full Parseval pairing `⟪x,y⟫=Σ_i⟪x,b_i⟫⟪b_i,y⟫` and norm Parseval are already correct. Consume UO-D01's Hilbert-basis cardinal independence and native coordinate reindexing to prove that two complete complex Hilbert spaces are unitarily isomorphic exactly when their Hilbert-basis cardinals agree. Separability means an at-most-countable basis, including finite and empty cases; the recorded “all separable Hilbert spaces are isomorphic” needs either equal dimension or both infinite-dimensional separable spaces. It does not restrict QF2's arbitrary-H positive-density adapter or its possibly nonseparable zero eigenspace. For bounded sesquilinear forms use native Riesz with `B(x,y)=⟪Ax,y⟫`; its least nonnegative bound is `‖A‖`. Use unit-ball suprema to include H=0, rather than a vacuous empty unit sphere or a least unrestricted real bound. Consume V2's completed algebraic Hilbert tensor carrier and product inner-product law. Preserve p.65's informal componentwise-pair notation and its factorization warning: a nonzero Cartesian pair (x,0) would have zero squared norm under that displayed product rule, so it cannot be the tensor carrier. These are source/realization comparisons, not a second generic Hilbert-space or tensor library.

QF6b owns the Rieffel source/observable application of the Dirac metric example. Consume [RiemannianGeometry R7.8](../RiemannianGeometry/README.md)'s general Clifford-module commutator-norm and intrinsic-distance theorem, including its quantitative bounded smooth Lipschitz approximation; that roadmap owns those generic proofs. For the source's path-connected open `O⊆ℝⁿ`, identify its `L²(O,H)` carrier and nonzero finite-dimensional Hermitian Clifford representation with that theorem's trivial-bundle case; retain faithfulness when identifying the source's chosen representation. Use self-adjoint generators `γ_j`, `γ_iγ_j+γ_jγ_i=2δᵢⱼ`, and the equivalent skew-adjoint cotangent action `c(dx_j)=−iγ_j`, so `D=−iΣ_jγ_j∂_j` on `C_c∞(O,H)`. Preserve the source's literal differential expression separately. Prove this sign/carrier dictionary and symmetry on the Euclidean compact-support core by integration by parts; consume R7.8's core commutator, operator-norm and intrinsic path-distance conclusions. The bounded real smooth functions with bounded gradient act by bounded `M_f`; their finite seminorm domain is taken modulo constants. On a nonconvex O the intrinsic path distance is generally not the restricted Euclidean distance. General O requires an essential-self-adjointness hypothesis or a specified self-adjoint extension and boundary condition before a self-adjoint observable is assigned. Own the concrete `O=ℝⁿ` observable comparison: Fourier transform identifies the closure with the self-adjoint multiplier `2πΣ_jξ_jγ_j` on `{u∈L² : |ξ|u∈L²}`; prove these bounded-gradient multipliers preserve its `H¹` domain and that the core and closed-operator commutators agree. These are source/realization comparisons, not another generic Dirac or metric library. The general extended Lip-norm/state-metric compactness criterion and the compact classical W₁ comparison belong to [CompactQuantumMetricSpaces Q1/Q3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f68f2050a03f8f90f27e47f8cc715b95f461553d/TauCetiRoadmap/CompactQuantumMetricSpaces/README.md); a path-connected open O is not thereby a compact quantum metric space.

For the source's finite-dimensional coefficient trace, consume [SpinGeometry G1.3](../SpinGeometry/README.md)'s scalar-trace formula and its positivity/faithfulness hypotheses. Identify the source's orthogonal coefficient basis `(e_i)`, require each `b(e_i,e_i)>0`, and identify its ordered Clifford monomials and trace normalization to obtain `τ(a*a)=Σ_I |α_I|²∏_{i∈I}b(e_i,e_i)`. An orthonormal basis is the special case with every diagonal coefficient equal to one. Preserve the source's unspecified scalar-field/conjugation wording and do not infer positivity for an indefinite form. Use the resulting coefficient-state dictionary and QF2/QF3's specified vector or density-operator state to interpret the spectral outcome law of the named self-adjoint Dirac realization; a finite-dimensional coefficient trace alone does not specify a state on all operators on `L²(O,H)`. Consume SpinRepresentations Layer7 for real Clifford classification and Bott periodicity, with the trace and differential-operator suppliers just identified serving their distinct purposes.

Dooley p.21's literal claim is that, with “further differentiability assumptions” referred to another source, `H=c∇²+c′`, followed by the displayed `H=−(1/(2m))∇²+c′`; preserve the coefficient/sign ambiguity in the transcript and do not claim this proves a classification of all quantum Hamiltonians. QF6a owns the restricted constant-coefficient symbol theorem stated above; self-adjointness and semiboundedness require separate coefficient/sign hypotheses. The source does not establish these hypotheses for its general `H`.

The source formulas on pp.56 and 93 give the derivative `U′(0)ψ=iAψ`, while p.168 uses the opposite sign in its generator limit. Preserve the literal conflict and derive each adopted generator sign from the chosen convention. The source also has L-component sign conflicts on p.214 versus pp.60, 225 and p.62; p.217 prints `−α/|x|` while p.216 prints `+α/|x|`; and p.216 writes `P_l=i m_l∇_l`. Record each literal assertion separately from the corrected model formula. Page 122 prints `P=(h/(2πi))d/dx`; p.222 derives
`e^(itP)ψ(x)=ψ(x−t/(2π))`. Keep those literal formulas and their disagreement with the roadmap
convention attached to their source examples. With this roadmap's convention `P=−i∂` and Fourier
kernel `e^(−2πixξ)`, `FPF⁻¹=M_(2πξ)` and `e^(itP)` translates by `x+t`. Derive translations
from the chosen convention rather than silently identifying incompatible source expressions.
The printed source formulas on pp.60/223 share the same scalar Weyl exponent, while p.111/p.113 have the internal product-sign discrepancy described in the QF4 Fock-operator section. Grundling p.118 defines `B(f,g)=Im(f,g)` in the CCR setup, and p.119 uses that prior definition. Dooley p.15's claim that a two-particle subspace has logic equivalent to that of a type-I von Neumann subalgebra is recorded literally; QF4 proves, for a specified closed subspace `K` with projection `p`, the projection-logic identification for the corner `pB(H₁⊗H₂)p≃B(K)` without extending this to unspecified subspaces or algebras. Grundling p.220 says simultaneous eigenvectors will be available. QF6b proves that the normalized hydrogen bound states ψ_(n,ℓ,m) form a joint orthonormal eigenbasis for H_rel, the angular Casimir L² and L₃ on the relative bound-state subspace, using strong commutation and the proved Laguerre/spherical-harmonic completeness there. The full relative Hilbert space has the separately stated continuous spectral representation, not a joint eigenbasis of these observables. A core commutator alone supplies neither conclusion.

**Actual Fourier/Weyl and pullback comparison (Grundling pp.222–225).** For the source's own P=FQF⁻¹, the negative2π Fourier convention gives `P=+i∂/(2π)` and `T_sψ(x)=ψ(x−s/(2π))`; this differs from the adopted physical momentum. With `M_tψ(x)=e^(itx)ψ(x)`, direct evaluation proves `M_tT_s=e^(+ist/(2π))T_sM_t`, opposite to p.223's displayed minus. Its literal `W_−(s,t)=e^(−ist/(4π))T_sM_t` has product coefficient `e^(i(st′+3s′t)/(4π))` relative to W_−(s+s′,t+t′), not the printed alternating coefficient. The symmetric corrected choice `W_+(s,t)=e^(+ist/(4π))T_sM_t` satisfies `W_+(s,t)W_+(s′,t′)=e^(i(s′t−st′)/(4π))W_+(s+s′,t+t′)` and `W_+(s,t)*=W_+(−s,−t)`. For D8's normalized Weyl convention `exp(−iσ(v,w)/2)`, the exact source-coordinate dictionary is `σ((s,t),(s′,t′))=(st′−s′t)/(2π)`. Keep pp.60/223's repeated literal sign, p.118's B=Im convention and pp.111/113's separate Fock sign discrepancy distinct. No universal Weyl or field carrier is redefined. Ordinary Fourier integrals are initially on Schwartz or appropriate L¹∩L² data, then extended by Plancherel continuity.

For the p.223 pullback use `V_Tψ(x)=|det DT(x)|^(1/2)ψ(Tx)`; it is the inverse-coordinate version of QF6a's U_T. Change of variables proves unitarity and V_(T⁻¹) gives the inverse. Preserve the unclear absolute-value glyph rather than asserting a visual resolution. Pullbacks obey `V_TV_S=V_(S∘T)` on the full diffeomorphism group, but a one-parameter subgroup commutes, so the p.224 rotation group law is correct. QF6a.FlowPullbacks supplies the explicit jointly smooth action hypothesis, strong continuity and full generator domain for the general coordinate-flow model; these rotations are its specialization. On C_c, uniform continuity and one common compact containing ball give L² strong continuity; extend by density and the norm1 bounds. On C_c∞, the chain rule and uniform derivative remainder on that same compact ball give L² difference-quotient convergence. Uniform convergence alone on infinite volume would not justify that implication. P.225 gives `iL_x=y∂_z−z∂_y`, hence the adopted `L_x=−i(y∂_z−z∂_y)`, agreeing with Q×P and opposite p.214. All faint facing sides222–225 and clipped/crossed-out text remain unresolved.

The hydrogen radial target states `α<0` for the Coulomb bound-state spectrum. Rotation-invariant
Fourier multipliers need not be affine in `−Δ`; include `(−Δ)²` as the explicit counterexample
unless a separately proved finite-order/locality hypothesis applies. The lattice of projections
on an infinite-dimensional Hilbert space is orthomodular but not modular by
VNA V2.NonmodularProjectionLattice, consumed in QF2.ModularityComparison.
V5.LatticeFinite supplies the modular statement for finite factors (type II₁);
type II∞ is nonmodular.

## References

- B. Iochum and G. Loupias, [“Banach-power-associative algebras and J-B algebras”](https://www.numdam.org/item/AIHPA_1985__43_2_211_0/), *Annales de l’I.H.P. Physique théorique* 43 (1985), 211–225: Propositions I.4–I.5 (p.214), Theorem V.1 and its proof (p.222), and Corollary V.3 (p.223) give the distributive Segal-to-JB construction. The internal quadratic-positivity and projection-order targets are stated separately in QF1.S.

- A. S. Holevo, *Probabilistic and Statistical Aspects of Quantum Theory*, 2nd ed., Edizioni
  della Normale (2011): effects, POVMs and outcome probabilities.
- A. Peres, *Quantum Theory: Concepts and Methods*, Kluwer (1993): states, measurement,
  entanglement and finite-dimensional examples.
- E. B. Davies, *Quantum Theory of Open Systems*, Academic Press (1976): operational
  measurements and channels.
- A. Wintner, [“The Unboundedness of Quantum-Mechanical Matrices”](https://journals.aps.org/pr/abstract/10.1103/PhysRev.71.738.2),
  *Physical Review* 71 (1947): 738: the bounded-commutator obstruction.
- M. Reed and B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*,
  revised and enlarged ed. (1980): Hilbert-space and spectral foundations.
- G. W. Mackey, *The Mathematical Foundations of Quantum Mechanics: A Lecture-Note Volume*,
  Benjamin (1963), and *Induced Representations of Groups and Quantum Mechanics* (1968):
  imprimitivity and representation interfaces.
- V. S. Varadarajan, *The Geometry of Quantum Theory*, Van Nostrand (1971), p. 136ff: the
  Kakutani–Mackey Hilbertization theorem cited by Dooley; the scan's hypothesis notation is too
  faint to read precisely.
- Mark Pankov, *Wigner-Type Theorems for Hilbert Grassmannians*, London Mathematical Society
  Lecture Note Series 460, Cambridge University Press (2020), Chapter 3 §3.3, Theorem 3.16,
  [PDF excerpt](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/562D210944736DD8A32589EAB0C62D9A/9781108790918c3_53-67.pdf/lattices-of-closed-subspaces.pdf): exact complex Banach hypotheses and proof route for the Kakutani–Mackey theorem.
- S. Kakutani and G. W. Mackey, “Two Characterizations of Real Hilbert Space,” *Annals of
  Mathematics* (2) 45, no. 1 (1944), 50–58: the separate real theorem (Theorems 1–2).
- R. F. Werner, “Quantum states with Einstein–Podolsky–Rosen correlations admitting a
  hidden-variable model,” *Phys. Rev. A* 40 (1989): finite bipartite state examples.
- A. Łuczak and H. Podsędkowska,
  [“Lüders Instruments, Generalised Lüders Theorem, and Some Aspects of Sufficiency”](https://link.springer.com/article/10.1007/s10773-014-2485-y)
  (2015), §V, Theorem V.7: discrete instrument additivity and weak versus strong repeatability.
- V. Moretti and D. Pastorello,
  [“Generalized Complex Spherical Harmonics, Frame Functions, and Gleason Theorem”](https://arxiv.org/abs/1205.4504)
  (2013): complex frame-function harmonic analysis. Boundedness alone does not supply
  a missing measurability or continuity proof.
- G. P. Gehér, [“Symmetries of projective spaces and spheres”](https://arxiv.org/abs/1606.03584)
  (2017): projective orthogonality and the Uhlhorn comparison.
